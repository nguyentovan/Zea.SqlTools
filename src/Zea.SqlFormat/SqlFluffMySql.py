"""MySQL syntax extensions for the SQLFluff bridge."""

from sqlfluff.core.parser import (
    BaseSegment,
    Bracketed,
    Delimited,
    OneOf,
    OptionallyBracketed,
    Ref,
    Sequence,
)


def _replace_child(grammar, original, replacement):
    index = grammar._elements.index(original)
    # Ref equality ignores match exclusions, so remove before inserting.
    return grammar.copy(remove=[original]).copy(insert=[replacement], at=index)


def _extend_create_table(dialect):
    original = dialect.get_segment("CreateTableStatementSegment")
    create_table = original.match_grammar
    *header, table_form, table_end_clause, options = create_table._elements
    table_options, partitions = options._elements
    partition_types = partitions._elements[2]
    columns = Delimited(Ref("ColumnReferenceSegment"))
    partition_types = partition_types.copy(
        insert=[Sequence(OneOf("RANGE", "LIST"), "COLUMNS", Bracketed(columns))]
    )
    range_columns = partitions._elements[2]
    partition_definitions = partitions._elements[-1]
    definitions_brackets = partition_definitions._elements[0]
    delimited_definitions = definitions_brackets._elements[0]
    definition = delimited_definitions._elements[0]
    definition_options = definition._elements[-1]
    values = definition_options._elements[0]
    bounds = values._elements[1]
    less_than = bounds._elements[0]
    old_bound_literal = less_than._elements[-1]
    new_bound_literal = OneOf(
        "MAXVALUE",
        Bracketed(Delimited("MAXVALUE", Ref("ExpressionSegment"))),
    )

    less_than = _replace_child(less_than, old_bound_literal, new_bound_literal)
    bounds = _replace_child(bounds, bounds._elements[0], less_than)
    values = _replace_child(values, values._elements[1], bounds)
    definition_options = _replace_child(definition_options, definition_options._elements[0], values)
    definition = _replace_child(definition, definition._elements[-1], definition_options)
    delimited_definitions = _replace_child(delimited_definitions, delimited_definitions._elements[0], definition)
    definitions_brackets = _replace_child(definitions_brackets, definitions_brackets._elements[0], delimited_definitions)
    partition_definitions = _replace_child(
        partition_definitions, partition_definitions._elements[0], definitions_brackets
    )
    partitioning = _replace_child(partitions, range_columns, partition_types)
    partitioning = _replace_child(
        partitioning, partitions._elements[-1], partition_definitions
    )
    option_names = table_options._elements[1]
    parameter_name = Ref("ParameterNameSegment")
    query_starters = OneOf("AS", "SELECT", "WITH", "TABLE", "VALUES", "IGNORE", "REPLACE")
    option_names = _replace_child(
        option_names,
        parameter_name,
        Ref("ParameterNameSegment", exclude=query_starters),
    )
    table_options_with_boundary = _replace_child(
        table_options, table_options._elements[1], option_names
    )
    table_options_and_partitions = _replace_child(options, partitions, partitioning)
    table_options_and_partitions = _replace_child(
        table_options_and_partitions, table_options, table_options_with_boundary
    )
    with_partitioning = _replace_child(create_table, options, table_options_and_partitions)

    column_definitions = Sequence(table_form._elements[0]._elements[0], optional=True)

    class CreateTableStatementSegment(original):
        match_grammar = OneOf(
            with_partitioning,
            Sequence(
                *header,
                column_definitions,
                table_end_clause,
                table_options_and_partitions,
                OneOf("IGNORE", "REPLACE", optional=True),
                Ref.keyword("AS", optional=True),
                OptionallyBracketed(Ref("SelectableGrammar")),
            ),
        )

    dialect.replace(CreateTableStatementSegment=CreateTableStatementSegment)


def _extend_queries(dialect):
    select_statement = dialect.get_segment("SelectStatementSegment")
    locking_clause = Ref("ForClauseSegment", optional=True)
    into_clause = Ref("IntoClauseSegment", optional=True)
    locking_tail = OneOf(
        Sequence(Ref("ForClauseSegment"), into_clause),
        Sequence(Ref("IntoClauseSegment"), locking_clause),
        optional=True,
    )
    ordered_select = (
        select_statement.match_grammar.copy(
            remove=[locking_clause, into_clause, into_clause]
        )
        .copy(insert=[into_clause], before=Ref("FromClauseSegment", optional=True))
        .copy(insert=[locking_tail])
    )

    class SelectStatementSegment(select_statement):
        match_grammar = ordered_select

    join_clause = dialect.get_segment("JoinClauseSegment")

    class JoinClauseSegment(join_clause):
        match_grammar = OneOf(
            Sequence(
                "STRAIGHT_JOIN",
                Ref("JoinTargetGrammar"),
                Ref("JoinOnConditionSegment", optional=True),
            ),
            join_clause.match_grammar,
        )

    class TableQuerySegment(BaseSegment):
        """The explicit table query introduced in MySQL 8.0.19."""

        type = "select_statement"
        match_grammar = Sequence("TABLE", Ref("TableReferenceSegment"))

    class OrderedTableValuesSegment(BaseSegment):
        """ORDER BY and LIMIT at the end of a standalone TABLE or VALUES query."""

        type = "select_statement"
        match_grammar = Sequence(
            OneOf(Ref("ZeaTableQuerySegment"), Ref("ValuesClauseSegment")),
            OneOf(
                Sequence(
                    Ref("OrderByClauseSegment"),
                    Ref("LimitClauseSegment", optional=True),
                ),
                Ref("LimitClauseSegment"),
            ),
        )

    dialect.add(
        ZeaTableQuerySegment=TableQuerySegment,
        ZeaOrderedTableValuesSegment=OrderedTableValuesSegment,
    )
    dialect.replace(
        SelectStatementSegment=SelectStatementSegment,
        JoinClauseSegment=JoinClauseSegment,
        NonSetSelectableGrammar=dialect.get_grammar("NonSetSelectableGrammar").copy(
            insert=[Ref("ZeaTableQuerySegment")]
        ),
        NonWithSelectableGrammar=dialect.get_grammar("NonWithSelectableGrammar").copy(
            insert=[Ref("ZeaOrderedTableValuesSegment")]
        ),
        OrderByClauseTerminators=dialect.get_grammar("OrderByClauseTerminators").copy(
            insert=[Ref("ForClauseSegment")]
        ),
    )


def _extend_statements(dialect):
    transaction = dialect.get_segment("TransactionStatementSegment")
    savepoint_name = Ref("SingleIdentifierGrammar")
    work = Ref.keyword("WORK", optional=True)
    completion = Sequence(
        Sequence("AND", Ref.keyword("NO", optional=True), "CHAIN", optional=True),
        Sequence(Ref.keyword("NO", optional=True), "RELEASE", optional=True),
        optional=True,
    )

    class TransactionStatementSegment(transaction):
        match_grammar = OneOf(
            Sequence(
                "START",
                "TRANSACTION",
                Delimited(
                    Sequence("WITH", "CONSISTENT", "SNAPSHOT"),
                    Sequence("READ", OneOf("WRITE", "ONLY")),
                    optional=True,
                ),
            ),
            Sequence("BEGIN", work),
            Sequence("COMMIT", work, completion),
            Sequence("ROLLBACK", work, completion),
            Sequence("ROLLBACK", work, "TO", Ref.keyword("SAVEPOINT", optional=True), savepoint_name),
            Sequence("SAVEPOINT", savepoint_name),
            Sequence("RELEASE", "SAVEPOINT", savepoint_name),
        )

    class TableLockStatementSegment(BaseSegment):
        type = "table_lock_statement"
        match_grammar = OneOf(
            Sequence(
                "LOCK",
                OneOf("TABLE", "TABLES"),
                Delimited(
                    Sequence(
                        Ref("TableReferenceSegment"),
                        Ref(
                            "AliasExpressionSegment",
                            exclude=OneOf("READ", "WRITE", "LOW_PRIORITY"),
                            optional=True,
                        ),
                        OneOf(
                            Sequence("READ", Ref.keyword("LOCAL", optional=True)),
                            Sequence(Ref.keyword("LOW_PRIORITY", optional=True), "WRITE"),
                        ),
                    )
                ),
            ),
            Sequence("UNLOCK", OneOf("TABLE", "TABLES")),
        )

    class LoadXmlStatementSegment(BaseSegment):
        type = "load_xml_statement"
        match_grammar = Sequence(
            "LOAD",
            "XML",
            OneOf("LOW_PRIORITY", "CONCURRENT", optional=True),
            Ref.keyword("LOCAL", optional=True),
            "INFILE",
            Ref("QuotedLiteralSegment"),
            OneOf("REPLACE", "IGNORE", optional=True),
            "INTO",
            "TABLE",
            Ref("TableReferenceSegment"),
            Sequence("CHARACTER", "SET", Ref("NakedIdentifierSegment"), optional=True),
            Sequence("ROWS", "IDENTIFIED", "BY", Ref("QuotedLiteralSegment"), optional=True),
            Sequence("IGNORE", Ref("NumericLiteralSegment"), OneOf("LINES", "ROWS"), optional=True),
            Bracketed(
                Delimited(Ref("ColumnReferenceSegment"), Ref("SessionVariableNameSegment")),
                optional=True,
            ),
            Ref("SetClauseListSegment", optional=True),
        )

    statement = dialect.get_segment("StatementSegment")

    class StatementSegment(statement):
        match_grammar = statement.match_grammar.copy(
            insert=[Ref("ZeaTableLockStatementSegment"), Ref("ZeaLoadXmlStatementSegment")]
        )

    dialect.add(
        ZeaTableLockStatementSegment=TableLockStatementSegment,
        ZeaLoadXmlStatementSegment=LoadXmlStatementSegment,
    )
    dialect.replace(
        StatementSegment=StatementSegment,
        TransactionStatementSegment=TransactionStatementSegment,
    )


def extend_mysql(dialect):
    _extend_queries(dialect)
    _extend_statements(dialect)
    _extend_create_table(dialect)
