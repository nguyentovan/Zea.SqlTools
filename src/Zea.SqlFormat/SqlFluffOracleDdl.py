"""Additional SQLFluff grammar for Oracle DDL and EXPLAIN PLAN."""

from sqlfluff.core.parser import (
    AnyNumberOf,
    BaseSegment,
    Bracketed,
    Delimited,
    OneOf,
    OptionallyBracketed,
    Ref,
    Sequence,
    StringParser,
)
from sqlfluff.core.parser.segments import KeywordSegment


class OracleRangePartitionSegment(BaseSegment):
    """A range partition bound and optional physical properties."""

    type = "oracle_range_partition"
    match_grammar = Sequence(
        "PARTITION",
        Ref("SingleIdentifierGrammar", optional=True),
        "VALUES",
        "LESS",
        "THAN",
        Bracketed(Delimited(OneOf("MAXVALUE", Ref("ExpressionSegment")))),
        Ref("OraclePhysicalAttributesSegment", optional=True),
    )


class OracleRangePartitionClauseSegment(BaseSegment):
    """Range partitioning for a relational table."""

    type = "oracle_range_partition_clause"
    match_grammar = Sequence(
        "PARTITION",
        "BY",
        "RANGE",
        Ref("BracketedColumnReferenceListGrammar"),
        Sequence("INTERVAL", Bracketed(Ref("ExpressionSegment")), optional=True),
        Bracketed(Delimited(Ref("OracleRangePartitionSegment"))),
    )


class OracleViewRestrictionSegment(BaseSegment):
    """An Oracle view's CHECK OPTION or READ ONLY restriction."""

    type = "oracle_view_restriction"
    match_grammar = Sequence(
        "WITH",
        OneOf(Sequence("CHECK", "OPTION"), Sequence("READ", "ONLY")),
        Sequence("CONSTRAINT", Ref("SingleIdentifierGrammar"), optional=True),
    )


class CreateMaterializedViewStatementSegment(BaseSegment):
    """Oracle materialized view creation with build and refresh attributes."""

    type = "create_materialized_view_statement"
    match_grammar = Sequence(
        "CREATE",
        "MATERIALIZED",
        "VIEW",
        Ref("IfNotExistsGrammar", optional=True),
        Ref("TableReferenceSegment"),
        Ref("BracketedColumnReferenceListGrammar", optional=True),
        Ref("OraclePhysicalAttributesSegment", optional=True),
        Sequence("BUILD", OneOf("IMMEDIATE", "DEFERRED"), optional=True),
        Sequence(
            "REFRESH",
            OneOf("FAST", "COMPLETE", "FORCE", optional=True),
            Sequence("ON", OneOf("COMMIT", "DEMAND", "STATEMENT"), optional=True),
            Sequence("START", "WITH", Ref("ExpressionSegment"), optional=True),
            Sequence("NEXT", Ref("ExpressionSegment"), optional=True),
            Sequence("WITH", OneOf("ROWID", Sequence("PRIMARY", "KEY")), optional=True),
            optional=True,
        ),
        Sequence(OneOf("ENABLE", "DISABLE"), "QUERY", "REWRITE", optional=True),
        "AS",
        OptionallyBracketed(Ref("SelectableGrammar")),
    )


def extend_oracle_ddl(dialect):
    """Extend the process-local SQLFluff Oracle dialect."""
    dialect.add(
        BuildKeywordSegment=StringParser("BUILD", KeywordSegment),
        CompleteKeywordSegment=StringParser("COMPLETE", KeywordSegment),
        DemandKeywordSegment=StringParser("DEMAND", KeywordSegment),
        FastKeywordSegment=StringParser("FAST", KeywordSegment),
        Statement_idKeywordSegment=StringParser("STATEMENT_ID", KeywordSegment),
        VirtualKeywordSegment=StringParser("VIRTUAL", KeywordSegment),
        OracleRangePartitionSegment=OracleRangePartitionSegment,
        OracleRangePartitionClauseSegment=OracleRangePartitionClauseSegment,
        OracleViewRestrictionSegment=OracleViewRestrictionSegment,
        CreateMaterializedViewStatementSegment=CreateMaterializedViewStatementSegment,
    )
    extend_columns_and_tables(dialect)
    extend_views_and_indexes(dialect)
    extend_truncate_and_explain(dialect)

    original_statement = dialect.get_segment("StatementSegment")

    class StatementSegment(original_statement):
        match_grammar = original_statement.match_grammar.copy(
            insert=[Ref("CreateMaterializedViewStatementSegment")]
        )

    dialect.replace(StatementSegment=StatementSegment)


def extend_columns_and_tables(dialect):
    # https://docs.oracle.com/en/database/oracle/oracle-database/26/sqlrf/CREATE-TABLE.html
    original_column = dialect.get_segment("ColumnDefinitionSegment")
    column_name, column_forms = original_column.match_grammar._elements
    untyped_constraints, typed_column = column_forms._elements
    identity = Ref("IdentityClauseGrammar", optional=True)
    constraints = AnyNumberOf(Ref("ColumnConstraintSegment"))
    typed_column = typed_column.copy(remove=[identity]).copy(
        insert=[identity], before=constraints
    )
    virtual_column = Sequence(
        Ref(
            "DatatypeSegment", optional=True,
            exclude=OneOf("AS", Sequence("GENERATED", "ALWAYS")),
        ),
        Sequence("GENERATED", "ALWAYS", optional=True),
        "AS",
        Bracketed(Ref("ExpressionSegment")),
        Ref.keyword("VIRTUAL", optional=True),
        constraints,
    )

    class ColumnDefinitionSegment(original_column):
        match_grammar = Sequence(
            column_name, OneOf(virtual_column, typed_column, untyped_constraints)
        )

    original_table = dialect.get_segment("CreateTableStatementSegment")
    table_forms = next(
        grammar for grammar in original_table.match_grammar._elements
        if isinstance(grammar, OneOf)
    )
    columns, as_select, like_table = table_forms._elements
    range_partition = Ref("OracleRangePartitionClauseSegment", optional=True)
    table_forms_with_partition = OneOf(
        columns.copy(insert=[range_partition]),
        as_select.copy(insert=[range_partition], before=Ref.keyword("AS")),
        like_table,
    )

    class CreateTableStatementSegment(original_table):
        match_grammar = original_table.match_grammar.copy(
            insert=[table_forms_with_partition], before=table_forms, remove=[table_forms]
        )

    dialect.replace(
        ColumnDefinitionSegment=ColumnDefinitionSegment,
        CreateTableStatementSegment=CreateTableStatementSegment,
    )


def extend_views_and_indexes(dialect):
    # https://docs.oracle.com/en/database/oracle/oracle-database/26/sqlrf/CREATE-VIEW.html
    original_view = dialect.get_segment("CreateViewStatementSegment")
    selectable = next(
        grammar for grammar in original_view.match_grammar._elements
        if isinstance(grammar, OptionallyBracketed)
    )
    restriction = Ref("OracleViewRestrictionSegment")
    restricted_selectable = OptionallyBracketed(
        Ref("SelectableGrammar"), terminators=[Ref("BatchDelimiterGrammar"), restriction]
    )

    class CreateViewStatementSegment(original_view):
        match_grammar = original_view.match_grammar.copy(
            insert=[restricted_selectable],
            before=selectable,
            remove=[selectable, Ref.keyword("MATERIALIZED", optional=True)],
        ).copy(insert=[Ref("OracleViewRestrictionSegment", optional=True)])

    original_select = dialect.get_segment("SelectStatementSegment")

    class SelectStatementSegment(original_select):
        match_grammar = original_select.match_grammar.copy(terminators=[restriction])

    original_unordered = dialect.get_segment("UnorderedSelectStatementSegment")

    class UnorderedSelectStatementSegment(original_unordered):
        match_grammar = original_unordered.match_grammar.copy(terminators=[restriction])

    # https://docs.oracle.com/en/database/oracle/oracle-database/26/sqlrf/CREATE-INDEX.html
    original_index_column = dialect.get_segment("IndexColumnDefinitionSegment")

    class IndexColumnDefinitionSegment(original_index_column):
        match_grammar = Sequence(
            Ref("ExpressionSegment"),
            OneOf("ASC", "DESC", optional=True),
        )

    dialect.replace(
        CreateViewStatementSegment=CreateViewStatementSegment,
        SelectStatementSegment=SelectStatementSegment,
        UnorderedSelectStatementSegment=UnorderedSelectStatementSegment,
        IndexColumnDefinitionSegment=IndexColumnDefinitionSegment,
    )


def extend_truncate_and_explain(dialect):
    # https://docs.oracle.com/en/database/oracle/oracle-database/19/sqlrf/TRUNCATE-TABLE.html
    original_truncate = dialect.get_segment("TruncateStatementSegment")

    class TruncateStatementSegment(original_truncate):
        match_grammar = original_truncate.match_grammar.copy(
            insert=[
                Sequence(
                    OneOf("DROP", Sequence("DROP", "ALL"), "REUSE"),
                    "STORAGE",
                    optional=True,
                ),
                Ref.keyword("CASCADE", optional=True),
            ]
        )

    # https://docs.oracle.com/en/database/oracle/oracle-database/26/sqlrf/EXPLAIN-PLAN.html
    original_explain = dialect.get_segment("ExplainStatementSegment")

    class ExplainStatementSegment(original_explain):
        match_grammar = Sequence(
            "EXPLAIN",
            "PLAN",
            Sequence(
                "SET", "STATEMENT_ID", Ref("EqualsSegment"), Ref("QuotedLiteralSegment"),
                optional=True,
            ),
            Sequence("INTO", Ref("TableReferenceSegment"), optional=True),
            "FOR",
            original_explain.explainable_stmt.copy(
                insert=[
                    Ref("MergeStatementSegment"),
                    Ref("CreateTableStatementSegment"),
                    Ref("CreateIndexStatementSegment"),
                ]
            ),
        )

    dialect.replace(
        TruncateStatementSegment=TruncateStatementSegment,
        ExplainStatementSegment=ExplainStatementSegment,
    )
