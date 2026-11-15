"""Oracle row-pattern matching and multidimensional model clauses."""

from sqlfluff.core.parser import (
    AnyNumberOf,
    BaseSegment,
    Bracketed,
    CodeSegment,
    Delimited,
    LiteralSegment,
    OneOf,
    Ref,
    RegexParser,
    Sequence,
    StringLexer,
    StringParser,
    SymbolSegment,
)
from sqlfluff.core.parser.segments import KeywordSegment


class RowPatternSegment(BaseSegment):
    """Pattern terms are concatenated and can contain alternatives and groups."""

    type = "pattern_expression"
    match_grammar = Delimited(
        AnyNumberOf(Ref("OraclePatternFactorGrammar"), min_times=1),
        delimiter=Ref("PipeSegment"),
    )


class MatchRecognizeClauseSegment(BaseSegment):
    """Match patterns in the rows of an Oracle table expression."""

    type = "match_recognize_clause"
    match_grammar = Sequence(
        "MATCH_RECOGNIZE",
        Bracketed(
            Ref("PartitionClauseSegment", optional=True),
            Ref("OrderByClauseSegment", optional=True),
            Sequence(
                "MEASURES",
                Delimited(
                    Sequence(
                        OneOf("RUNNING", "FINAL", optional=True),
                        Ref("ExpressionSegment"),
                        "AS",
                        Ref("SingleIdentifierGrammar"),
                    ),
                ),
                optional=True,
            ),
            OneOf(
                Sequence("ONE", "ROW", "PER", "MATCH"),
                Sequence("ALL", "ROWS", "PER", "MATCH"),
                optional=True,
            ),
            Sequence(
                "AFTER", "MATCH", "SKIP",
                OneOf(
                    Sequence("PAST", "LAST", "ROW"),
                    Sequence("TO", "NEXT", "ROW"),
                    Sequence("TO", OneOf("FIRST", "LAST", optional=True), Ref("SingleIdentifierGrammar")),
                ),
                optional=True,
            ),
            "PATTERN",
            Bracketed(Ref("OracleRowPatternSegment")),
            Sequence(
                "SUBSET",
                Delimited(Sequence(
                    Ref("SingleIdentifierGrammar"),
                    Ref("EqualsSegment"),
                    Bracketed(Delimited(Ref("SingleIdentifierGrammar"))),
                )),
                optional=True,
            ),
            "DEFINE",
            Delimited(Sequence(Ref("SingleIdentifierGrammar"), "AS", Ref("ExpressionSegment"))),
        ),
        Ref("SingleIdentifierGrammar", optional=True),
    )


class ModelCellAccessorSegment(BaseSegment):
    """The model cell coordinates on the left side of a rule."""

    type = "array_accessor"
    match_grammar = Bracketed(Delimited(Ref("ExpressionSegment")), bracket_type="square")


class ModelClauseSegment(BaseSegment):
    """Apply calculation rules to the cells of an Oracle query model."""

    type = "model_clause"
    match_grammar = Sequence(
        "MODEL",
        Sequence("RETURN", OneOf("UPDATED", "ALL"), "ROWS", optional=True),
        AnyNumberOf(Sequence(
            "REFERENCE", Ref("SingleIdentifierGrammar"), "ON",
            Bracketed(Ref("SelectableGrammar")),
            Ref("OracleModelColumnsGrammar"),
            Ref("OracleModelCellOptionsGrammar", optional=True),
        )),
        Sequence("MAIN", Ref("SingleIdentifierGrammar"), optional=True),
        Ref("OracleModelColumnsGrammar"),
        Ref("OracleModelCellOptionsGrammar", optional=True),
        Sequence(
            "RULES",
            Ref("OracleModelRuleModeGrammar", optional=True),
            Sequence(OneOf("AUTOMATIC", "SEQUENTIAL"), "ORDER", optional=True),
            Sequence(
                "ITERATE",
                Bracketed(Ref("OracleUnsignedIntegerSegment")),
                Sequence("UNTIL", Bracketed(Ref("ExpressionSegment")), optional=True),
                optional=True,
            ),
            optional=True,
        ),
        Bracketed(Delimited(Sequence(
            Ref("OracleModelRuleModeGrammar", optional=True),
            Ref("ColumnReferenceSegment"),
            Ref("OracleModelCellAccessorSegment"),
            Ref("OrderByClauseSegment", optional=True),
            Ref("EqualsSegment"),
            Ref("ExpressionSegment"),
        ))),
    )


def extend_oracle_analytics(dialect):
    """Register Oracle-specific analytics on the process-local dialect."""
    # This bridge receives an expanded dialect, so create missing contextual
    # keyword parsers directly without reserving their spelling as identifiers.
    keywords = """
        MATCH_RECOGNIZE MEASURES ONE PER PAST PATTERN SUBSET PERMUTE RUNNING
        MAIN RULES UPDATED REFERENCE NAV SINGLE UPSERT AUTOMATIC SEQUENTIAL
    """.split()
    known_keywords = dialect.sets("reserved_keywords") | dialect.sets("unreserved_keywords")
    dialect.add(**{
        f"{word.capitalize()}KeywordSegment": StringParser(word, KeywordSegment)
        for word in keywords if word not in known_keywords
    })
    dialect.insert_lexer_matchers([StringLexer("dollar", "$", CodeSegment)], before="word")

    integer = Ref("OracleUnsignedIntegerSegment")
    pattern = Ref("OracleRowPatternSegment")
    question = Ref("ParameterSegment")
    quantifier = OneOf(
        Sequence(
            OneOf(
                Ref("PositiveSegment"), Ref("StarSegment"), question,
                Bracketed(
                    Sequence(
                        Ref("OracleUnsignedIntegerSegment", optional=True),
                        Ref("CommaSegment"),
                        Ref("OracleUnsignedIntegerSegment", optional=True),
                    ),
                    bracket_type="curly",
                ),
            ),
            Ref("ParameterSegment", optional=True),
        ),
        Bracketed(integer, bracket_type="curly"),
        optional=True,
    )
    model_columns = Bracketed(Delimited(Sequence(
        Ref("ExpressionSegment"),
        Ref("AliasExpressionSegment", optional=True),
    )))

    dialect.add(
        OracleRowPatternSegment=RowPatternSegment,
        OracleMatchRecognizeClauseSegment=MatchRecognizeClauseSegment,
        OracleModelClauseSegment=ModelClauseSegment,
        OracleModelCellAccessorSegment=ModelCellAccessorSegment,
        OracleUnsignedIntegerSegment=RegexParser(r"[0-9]+", LiteralSegment, type="numeric_literal"),
        OraclePatternDollarSegment=StringParser("$", SymbolSegment, type="dollar"),
        # This mirrors the grouping and alternation in the Trino grammar,
        # using Oracle's set of pattern primaries and quantifiers.
        OraclePatternFactorGrammar=Sequence(
            OneOf(
                Ref("SingleIdentifierGrammar"),
                Ref("BitwiseXorSegment"),
                Ref("OraclePatternDollarSegment"),
                Bracketed(Ref("OracleRowPatternSegment", optional=True)),
                Bracketed(
                    Ref("NegativeSegment"), pattern, Ref("NegativeSegment"),
                    bracket_type="curly",
                ),
                Sequence("PERMUTE", Bracketed(Delimited(pattern))),
            ),
            quantifier,
        ),
        OracleModelColumnsGrammar=Sequence(
            Sequence("PARTITION", "BY", model_columns, optional=True),
            "DIMENSION", "BY", model_columns,
            "MEASURES", model_columns,
        ),
        OracleModelCellOptionsGrammar=OneOf(
            Sequence(
                OneOf("IGNORE", "KEEP"), "NAV",
                Ref("OracleModelUniqueGrammar", optional=True),
            ),
            Ref("OracleModelUniqueGrammar"),
        ),
        OracleModelUniqueGrammar=Sequence(
            "UNIQUE", OneOf("DIMENSION", Sequence("SINGLE", "REFERENCE")),
        ),
        OracleModelRuleModeGrammar=OneOf("UPDATE", Sequence("UPSERT", Ref.keyword("ALL", optional=True))),
    )

    unordered_select = dialect.get_segment("UnorderedSelectStatementSegment")
    select = dialect.get_segment("SelectStatementSegment")
    model_clause = Ref("OracleModelClauseSegment", optional=True)

    class UnorderedSelectStatementSegment(unordered_select):
        match_grammar = unordered_select.match_grammar.copy(insert=[model_clause])

    class SelectStatementSegment(select):
        match_grammar = select.match_grammar.copy(
            insert=[model_clause], before=Ref("OrderByClauseSegment", optional=True),
        )

    dialect.replace(
        UnorderedSelectStatementSegment=UnorderedSelectStatementSegment,
        SelectStatementSegment=SelectStatementSegment,
        JoinLikeClauseGrammar=OneOf(
            dialect.get_grammar("JoinLikeClauseGrammar"),
            Ref("OracleMatchRecognizeClauseSegment"),
        ),
        FromClauseTerminatorGrammar=dialect.get_grammar("FromClauseTerminatorGrammar").copy(
            insert=[Ref("OracleModelClauseSegment")],
        ),
    )
