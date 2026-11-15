"""Extend SQLFluff's Oracle grammar for PL/SQL, transactions and documents."""

from sqlfluff.core.parser import (
    AnySetOf,
    BaseSegment,
    Bracketed,
    Delimited,
    KeywordSegment,
    OneOf,
    Ref,
    Sequence,
    StringParser,
    WordSegment,
)


def extend_oracle_procedural(dialect):
    transaction = dialect.get_segment("TransactionStatementSegment")
    forall = dialect.get_segment("ForAllStatementSegment")
    statement = dialect.get_segment("PlsqlStatementSegment")
    function = dialect.get_segment("FunctionSegment")
    added_keywords = ("ASCII", "EXCEPTIONS", "PASSING", "XMLNAMESPACES", "XMLTYPE")
    dialect.sets("unreserved_keywords").update(added_keywords)
    dialect.add(
        **{
            f"{word.capitalize()}KeywordSegment": StringParser(word, KeywordSegment)
            for word in added_keywords
        }
    )

    class TransactionStatementSegment(transaction):
        match_grammar = OneOf(
            Sequence("SAVEPOINT", Ref("SingleIdentifierGrammar")),
            Sequence(
                "ROLLBACK",
                Ref.keyword("WORK", optional=True),
                "TO",
                Ref.keyword("SAVEPOINT", optional=True),
                Ref("SingleIdentifierGrammar", exclude=Ref.keyword("SAVEPOINT")),
            ),
            Sequence(
                "ROLLBACK",
                Ref.keyword("WORK", optional=True),
                "FORCE",
                Ref("QuotedLiteralSegment"),
            ),
            transaction.match_grammar,
        )

    class ForAllStatementSegment(forall):
        # FORALL supports dense ranges, sparse indexes, and index collections.
        match_grammar = Sequence(
            "FORALL",
            Ref("NakedIdentifierSegment"),
            "IN",
            OneOf(
                Ref("IterationSteppedControlGrammar"),
                Sequence(
                    "INDICES",
                    "OF",
                    Ref("ObjectReferenceSegment"),
                    Sequence(
                        "BETWEEN",
                        Ref("Expression_B_Grammar"),
                        "AND",
                        Ref("ExpressionSegment"),
                        optional=True,
                    ),
                ),
                Sequence("VALUES", "OF", Ref("ObjectReferenceSegment")),
            ),
            Sequence("SAVE", "EXCEPTIONS", optional=True),
            OneOf(
                Ref("DeleteStatementSegment"),
                Ref("InsertStatementSegment"),
                Ref("MergeStatementSegment"),
                Ref("UpdateStatementSegment"),
                Ref("ExecuteImmediateSegment"),
            ),
        )

    class PlsqlLabelSegment(BaseSegment):
        type = "plsql_label"
        match_grammar = Sequence(
            Sequence(
                Ref("RawLessThanSegment"),
                Ref("RawLessThanSegment"),
                allow_gaps=False,
            ),
            Ref("SingleIdentifierGrammar"),
            Sequence(
                Ref("RawGreaterThanSegment"),
                Ref("RawGreaterThanSegment"),
                allow_gaps=False,
            ),
        )

    class LabeledLoopStatementSegment(BaseSegment):
        type = "labeled_loop_statement"
        match_grammar = Sequence(
            Ref("ZeaOraclePlsqlLabelSegment"),
            OneOf(
                Ref("ForLoopStatementSegment"),
                Ref("WhileLoopStatementSegment"),
                Ref("LoopStatementSegment"),
            ),
        )

    class PlsqlStatementSegment(statement):
        match_grammar = statement.match_grammar.copy(
            insert=[Ref("ZeaOracleLabeledLoopStatementSegment")],
            before=Ref("ProcedureCallStatementSegment"),
        )

    class XmlForestFunctionNameSegment(BaseSegment):
        type = "function_name"
        match_grammar = StringParser(
            "XMLFOREST", WordSegment, type="function_name_identifier"
        )

    class XmlForestFunctionContentsSegment(BaseSegment):
        type = "function_contents"
        match_grammar = Bracketed(
            Delimited(
                Sequence(
                    Ref("ExpressionSegment"),
                    Sequence(
                        "AS",
                        OneOf(
                            Sequence("EVALNAME", Ref("ExpressionSegment")),
                            Ref("SingleIdentifierGrammar"),
                        ),
                        optional=True,
                    ),
                ),
            ),
        )

    class XmlTableFunctionNameSegment(BaseSegment):
        type = "function_name"
        match_grammar = StringParser(
            "XMLTABLE", WordSegment, type="function_name_identifier"
        )

    class XmlTableColumnDefinitionSegment(BaseSegment):
        type = "xml_table_column_definition"
        match_grammar = Sequence(
            Ref("SingleIdentifierGrammar"),
            OneOf(
                Sequence("FOR", "ORDINALITY"),
                Sequence(
                    OneOf(
                        Sequence(
                            "XMLTYPE",
                            Bracketed("SEQUENCE", optional=True),
                            "BY",
                            "REF",
                        ),
                        Ref("DatatypeSegment"),
                    ),
                    Sequence("PATH", Ref("QuotedLiteralSegment"), optional=True),
                    Sequence("DEFAULT", Ref("ExpressionSegment"), optional=True),
                ),
            ),
        )

    class XmlTableFunctionContentsSegment(BaseSegment):
        type = "function_contents"
        match_grammar = Bracketed(
            Sequence(
                "XMLNAMESPACES",
                Bracketed(
                    Delimited(
                        OneOf(
                            Sequence("DEFAULT", Ref("QuotedLiteralSegment")),
                            Sequence(
                                Ref("QuotedLiteralSegment"),
                                "AS",
                                Ref("SingleIdentifierGrammar"),
                            ),
                        ),
                    ),
                ),
                Ref("CommaSegment"),
                optional=True,
            ),
            Ref("QuotedLiteralSegment"),
            Sequence(
                "PASSING",
                Sequence("BY", "VALUE", optional=True),
                Delimited(
                    Sequence(
                        Ref("ExpressionSegment"),
                        Sequence("AS", Ref("SingleIdentifierGrammar"), optional=True),
                    ),
                ),
                optional=True,
            ),
            Sequence("RETURNING", "SEQUENCE", "BY", "REF", optional=True),
            Sequence(
                "COLUMNS",
                Delimited(Ref("ZeaOracleXmlTableColumnDefinitionSegment")),
                optional=True,
            ),
        )

    class JsonValueFunctionNameSegment(BaseSegment):
        type = "function_name"
        match_grammar = StringParser(
            "JSON_VALUE", WordSegment, type="function_name_identifier"
        )

    json_value_default = OneOf(
        "NULL",
        "ERROR",
        Sequence(
            "DEFAULT",
            OneOf(Ref("QualifiedNumericLiteralSegment"), Ref("LiteralGrammar")),
        ),
    )

    class JsonValueFunctionContentsSegment(BaseSegment):
        type = "function_contents"
        match_grammar = Bracketed(
            Ref("ExpressionSegment"),
            Sequence("FORMAT", "JSON", optional=True),
            Ref("CommaSegment"),
            Ref("QuotedLiteralSegment"),
            AnySetOf(
                Sequence(
                    "RETURNING",
                    Ref("DatatypeSegment"),
                    Ref.keyword("TRUNCATE", optional=True),
                    Ref.keyword("ASCII", optional=True),
                ),
                Sequence(json_value_default, "ON", "ERROR"),
                Sequence(json_value_default, "ON", "EMPTY"),
                optional=True,
            ),
        )

    class FunctionSegment(function):
        match_grammar = function.match_grammar.copy(
            insert=[
                Sequence(
                    Ref("ZeaOracleXmlForestFunctionNameSegment"),
                    Ref("ZeaOracleXmlForestFunctionContentsSegment"),
                ),
                Sequence(
                    Ref("ZeaOracleXmlTableFunctionNameSegment"),
                    Ref("ZeaOracleXmlTableFunctionContentsSegment"),
                ),
                Sequence(
                    Ref("ZeaOracleJsonValueFunctionNameSegment"),
                    Ref("ZeaOracleJsonValueFunctionContentsSegment"),
                ),
            ],
            at=0,
        )

    dialect.add(
        ZeaOraclePlsqlLabelSegment=PlsqlLabelSegment,
        ZeaOracleLabeledLoopStatementSegment=LabeledLoopStatementSegment,
        ZeaOracleXmlForestFunctionNameSegment=XmlForestFunctionNameSegment,
        ZeaOracleXmlForestFunctionContentsSegment=XmlForestFunctionContentsSegment,
        ZeaOracleXmlTableFunctionNameSegment=XmlTableFunctionNameSegment,
        ZeaOracleXmlTableFunctionContentsSegment=XmlTableFunctionContentsSegment,
        ZeaOracleXmlTableColumnDefinitionSegment=XmlTableColumnDefinitionSegment,
        ZeaOracleJsonValueFunctionNameSegment=JsonValueFunctionNameSegment,
        ZeaOracleJsonValueFunctionContentsSegment=JsonValueFunctionContentsSegment,
    )
    dialect.replace(
        TransactionStatementSegment=TransactionStatementSegment,
        PlsqlStatementSegment=PlsqlStatementSegment,
        ForAllStatementSegment=ForAllStatementSegment,
        FunctionSegment=FunctionSegment,
        FunctionNameExclusionGrammar=dialect.get_grammar("FunctionNameExclusionGrammar").copy(
            insert=[
                Sequence(Ref(name), Ref("StartBracketSegment"))
                for name in (
                    "ZeaOracleXmlForestFunctionNameSegment",
                    "ZeaOracleXmlTableFunctionNameSegment",
                    "ZeaOracleJsonValueFunctionNameSegment",
                )
            ],
        ),
    )
