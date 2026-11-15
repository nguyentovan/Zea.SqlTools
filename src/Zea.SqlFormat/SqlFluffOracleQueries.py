"""Structured Oracle query and DML syntax missing in SQLFluff."""

from sqlfluff.core.parser import (
    AnyNumberOf,
    BaseSegment,
    Bracketed,
    Delimited,
    KeywordSegment,
    LiteralSegment,
    OneOf,
    Ref,
    RegexParser,
    Sequence,
    StringParser,
    TypedParser,
)


def extend_oracle_queries(dialect):
    """Extend only the invocation's Oracle dialect."""
    select = dialect.get_segment("SelectStatementSegment")
    set_expression = dialect.get_segment("SetExpressionSegment")
    from_element = dialect.get_segment("FromExpressionElementSegment")
    column = dialect.get_segment("ColumnReferenceSegment")
    join = dialect.get_segment("JoinClauseSegment")
    cte = dialect.get_segment("CTEDefinitionSegment")
    temporal = dialect.get_segment("TemporalQuerySegment")
    sample = dialect.get_segment("SamplingExpressionSegment")
    insert = dialect.get_segment("InsertStatementSegment")
    assignment = dialect.get_segment("SetClauseSegment")

    row_limit = OneOf(
        Sequence(Ref("OffsetClauseSegment"), Ref("FetchClauseSegment", optional=True)),
        Ref("FetchClauseSegment"),
    )
    lock = Ref("ForUpdateGrammar", optional=True)
    limit = Ref("LimitClauseSegment", optional=True)

    class SelectStatementSegment(select):
        # Oracle does not allow a row limit and row lock in the same SELECT.
        match_grammar = select.match_grammar.copy(
            insert=[OneOf(row_limit, Ref("ForUpdateGrammar"), optional=True)],
            before=Ref("FetchClauseSegment", optional=True),
            remove=[lock, lock, limit, Ref("FetchClauseSegment", optional=True)],
        )

    class SetExpressionSegment(set_expression):
        match_grammar = set_expression.match_grammar.copy(
            insert=[OneOf(row_limit, optional=True)], before=limit, remove=[limit],
        )

    class ColumnReferenceSegment(column):
        # ROWID is reserved as an identifier, but valid as a pseudocolumn.
        match_grammar = OneOf(
            Sequence(
                AnyNumberOf(
                    Sequence(Ref("SingleIdentifierGrammar"), Ref("DotSegment")),
                ),
                "ROWID",
            ),
            column.match_grammar,
        )

    class LeadingDecimalSegment(BaseSegment):
        # Keep the existing lexer: two dots are significant in PL/SQL ranges.
        type = "numeric_literal"
        match_grammar = Sequence(
            Ref("DotSegment"),
            RegexParser(r"^\d+(?:[eE][+-]?\d+)?$", LiteralSegment, type="numeric_literal"),
            allow_gaps=False,
        )

    partition = Sequence("PARTITION", "BY", Bracketed(Delimited(Ref("ExpressionSegment"))))
    outer_join = Sequence(OneOf("LEFT", "RIGHT"), Ref.keyword("OUTER", optional=True), "JOIN")
    join_condition = OneOf(Ref("JoinOnConditionSegment"), Ref("JoinUsingConditionGrammar"))

    class JoinClauseSegment(join):
        match_grammar = OneOf(
            Sequence(OneOf("CROSS", "OUTER"), "APPLY", Ref("JoinTargetGrammar")),
            Sequence(partition, outer_join, Ref("JoinTargetGrammar"), join_condition),
            Sequence(outer_join, Ref("JoinTargetGrammar"), partition, join_condition),
            join.match_grammar,
        )

    class CTEDefinitionSegment(cte):
        match_grammar = cte.match_grammar.copy(
            insert=[
                Sequence(
                    "SEARCH", OneOf("DEPTH", "BREADTH"), "FIRST", "BY",
                    Delimited(
                        Sequence(
                            Ref("SingleIdentifierGrammar"),
                            OneOf("ASC", "DESC", optional=True),
                            Sequence("NULLS", OneOf("FIRST", "LAST"), optional=True),
                        ),
                    ),
                    "SET", Ref("SingleIdentifierGrammar"), optional=True,
                ),
                Sequence(
                    "CYCLE", Delimited(Ref("SingleIdentifierGrammar")),
                    "SET", Ref("SingleIdentifierGrammar"),
                    "TO", Ref("QuotedLiteralSegment"),
                    "DEFAULT", Ref("QuotedLiteralSegment"), optional=True,
                ),
            ],
        )

    class TemporalQuerySegment(temporal):
        match_grammar = OneOf(
            Sequence(
                StringParser("VERSIONS", KeywordSegment), "BETWEEN", OneOf("SCN", "TIMESTAMP"),
                OneOf("MINVALUE", Ref("Expression_B_Grammar")),
                "AND", OneOf("MAXVALUE", Ref("Expression_B_Grammar")),
            ),
            temporal.match_grammar,
        )

    class SamplingExpressionSegment(sample):
        match_grammar = Sequence(
            StringParser("SAMPLE", KeywordSegment),
            StringParser("BLOCK", KeywordSegment, optional=True),
            Bracketed(Ref("NumericLiteralSegment")),
            Sequence(
                StringParser("SEED", KeywordSegment),
                Bracketed(Ref("NumericLiteralSegment")), optional=True,
            ),
        )

    sample_clause = Ref("SamplingExpressionSegment", optional=True)
    table_with_sample = from_element._base_from_expression_element.copy(
        remove=[sample_clause],
    ).copy(
        insert=[sample_clause],
        before=Ref("TemporalQuerySegment", optional=True),
    )

    class FromExpressionElementSegment(from_element):
        match_grammar = OneOf(
            table_with_sample,
            Bracketed(Sequence(table_with_sample, AnyNumberOf(Ref("JoinClauseSegment")))),
        )

    into = Sequence(
        "INTO", Ref("TableReferenceSegment"),
        Bracketed(Delimited(Ref("ColumnReferenceSegment")), optional=True),
        Ref("ValuesClauseSegment", optional=True),
        insert._error_logging_clause,
    )

    class InsertStatementSegment(insert):
        match_grammar = OneOf(
            Sequence(
                "INSERT", OneOf("ALL", "FIRST"),
                AnyNumberOf(
                    Sequence(
                        "WHEN", Ref("ExpressionSegment", terminators=["THEN"]),
                        "THEN", AnyNumberOf(into, min_times=1),
                    ),
                    min_times=1,
                ),
                Sequence("ELSE", AnyNumberOf(into, min_times=1), optional=True),
                Ref("SelectableGrammar"),
            ),
            insert.match_grammar,
        )

    class SetClauseSegment(assignment):
        match_grammar = OneOf(
            Sequence(
                Bracketed(Delimited(Ref("ColumnReferenceSegment"))),
                Ref("EqualsSegment"), Bracketed(Ref("SelectableGrammar")),
            ),
            assignment.match_grammar,
        )

    dialect.add(ZeaLeadingDecimalSegment=LeadingDecimalSegment)
    dialect.replace(
        SelectStatementSegment=SelectStatementSegment,
        SetExpressionSegment=SetExpressionSegment,
        FromExpressionElementSegment=FromExpressionElementSegment,
        ColumnReferenceSegment=ColumnReferenceSegment,
        NumericLiteralSegment=OneOf(
            TypedParser("numeric_literal", LiteralSegment, type="numeric_literal"),
            Ref("ZeaLeadingDecimalSegment"),
        ),
        ForUpdateGrammar=Sequence(
            "FOR", "UPDATE",
            Sequence("OF", Delimited(Ref("ColumnReferenceSegment")), optional=True),
            OneOf(
                "NOWAIT",
                Sequence("WAIT", Ref("NumericLiteralSegment")),
                Sequence("SKIP", "LOCKED"),
                optional=True,
            ),
        ),
        JoinClauseSegment=JoinClauseSegment,
        CTEDefinitionSegment=CTEDefinitionSegment,
        TemporalQuerySegment=TemporalQuerySegment,
        SamplingExpressionSegment=SamplingExpressionSegment,
        InsertStatementSegment=InsertStatementSegment,
        SetClauseSegment=SetClauseSegment,
    )
