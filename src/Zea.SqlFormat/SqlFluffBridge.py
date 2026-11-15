"""Expose SQLFluff's lexer and parser without applying settings from SQL input."""

import json
import runpy
import sys
from pathlib import Path

from sqlfluff.core import FluffConfig, SQLFluffUserError
from sqlfluff.core.dialects import dialect_readout
from sqlfluff.core.errors import SQLParseError
from sqlfluff.core.parser import Lexer, Parser


def extend_tsql(dialect):
    """Apply SQL Server syntax extensions to the process-local SQLFluff dialect."""
    from sqlfluff.core.parser import (
        BaseSegment,
        Bracketed,
        CodeSegment,
        Delimited,
        LiteralSegment,
        OneOf,
        Ref,
        RegexLexer,
        Sequence,
        StringParser,
    )
    from sqlfluff.core.parser.segments import KeywordSegment

    # Retain SQLFluff's nested comment pattern but keep the original comment
    # as one formatting token, including its internal line endings.
    block_comment = next(
        matcher for matcher in dialect.get_lexer_matchers()
        if matcher.name == "block_comment"
    )

    # SQL Server uses two closing brackets to escape one in a delimited name.
    dialect.patch_lexer_matchers(
        [
            RegexLexer(
                "square_quote",
                r"\[(?:[^\]]|\]\])*\]",
                CodeSegment,
                segment_kwargs={
                    "quoted_value": (r"\[((?:[^\]]|\]\])*)\]", 1),
                    "escape_replacements": [(r"\]\]", "]")],
                },
            ),
            RegexLexer(
                block_comment.name,
                block_comment.template,
                block_comment.segment_class,
                segment_kwargs=block_comment.segment_kwargs,
            ),
        ]
    )

    # SQL Server allows a number to touch the next keyword or alias, even
    # when a scientific literal has an exponent marker but no exponent digits.
    # Leave hex and full exponents to the stock numeric and adjacency rules.
    dialect.insert_lexer_matchers(
        [
            RegexLexer(
                "numeric_literal",
                r"(?:[0-9]+(?:\.[0-9]*)?|\.[0-9]+)[eE](?>[+-]?)(?!\d)"
                r"|(?!0[xX])(?>\d+\.\d+|\d+\.(?!\.)|\.\d+|\d+)"
                r"(?>(?:[eE][+-]?\d+)?)(?=[_\p{L}])",
                LiteralSegment,
            ),
        ],
        before="numeric_literal",
    )

    # SQL Server 2025 adds the ANSI string concatenation operator.
    concat = dialect.get_segment("ConcatSegment")

    class ConcatSegment(concat):
        match_grammar = OneOf(
            Sequence(Ref("PipeSegment"), Ref("PipeSegment"), allow_gaps=False),
            concat.match_grammar,
        )

    dialect.replace(ConcatSegment=ConcatSegment)

    # WITH XMLNAMESPACES is a statement prefix, optionally followed by CTEs.
    # https://learn.microsoft.com/sql/t-sql/xml/with-xmlnamespaces
    class XmlNamespacesClauseSegment(BaseSegment):
        type = "xml_namespaces_clause"
        match_grammar = Sequence(
            StringParser("xmlnamespaces", KeywordSegment),
            Bracketed(
                Delimited(
                    OneOf(
                        Sequence("DEFAULT", Ref("QuotedLiteralSegmentOptWithN")),
                        Sequence(
                            Ref("QuotedLiteralSegmentOptWithN"),
                            "AS",
                            Ref("SingleIdentifierGrammar"),
                        ),
                    )
                )
            ),
        )

    original = dialect.get_segment("WithCompoundStatementSegment")

    class WithCompoundStatementSegment(original):
        match_grammar = OneOf(
            # If both alternatives consume the same range, SQLFluff chooses
            # the first. Its CTE grammar can consume namespace declarations
            # as an unparsable bracketed subquery.
            Sequence(
                "WITH",
                Ref("ZeaXmlNamespacesClauseSegment"),
                Sequence(
                    Ref("CommaSegment"),
                    Delimited(Ref("CTEDefinitionSegment"), terminators=["SELECT"]),
                    optional=True,
                ),
                OneOf(
                    Ref("NonWithSelectableGrammar"),
                    Ref("NonWithNonSelectableGrammar"),
                    Ref("MergeStatementSegment"),
                ),
            ),
            original.match_grammar,
        )

    dialect.add(ZeaXmlNamespacesClauseSegment=XmlNamespacesClauseSegment)
    dialect.replace(WithCompoundStatementSegment=WithCompoundStatementSegment)

    # A scalar subquery requires parentheses. Allowing a bare SELECT here
    # also lets an OUTPUT expression absorb the SELECT source after t.*
    # as if the star were multiplication. Keep the bracketed SELECT alternative.
    expression = dialect.get_grammar("Expression_D_Grammar")
    bare_select = Ref("SelectStatementSegment")
    for atom in expression._elements:
        if isinstance(atom, OneOf) and bare_select in atom._elements:
            dialect.replace(
                Expression_D_Grammar=expression.copy(
                    insert=[atom.copy(remove=[bare_select])],
                    before=atom,
                    remove=[atom],
                )
            )
            break

    statements = runpy.run_path(str(Path(__file__).with_name("SqlFluffTsqlStatements.py")))
    statements["extend_tsql_statements"](dialect)


def configure_parser_limits(config, token_count):
    # SQLFluff counts both lexer tokens and materialized parse nodes. A long
    # sequence of ordinary statements needs a larger budget than a small query.
    default_nodes = config.get("max_parse_nodes")
    node_budget = min(1_000_000, max(default_nodes, 4 * token_count))
    config.set_value(["max_parse_nodes"], node_budget)

    # A nested SELECT traverses several grammar layers per SQL nesting level.
    # Keep the grammar depth bounded and raise Python's independent stack limit
    # so that SQLFluff can report its own depth diagnostic.
    depth_budget = max(config.get("max_parse_depth"), 1600)
    config.set_value(["max_parse_depth"], depth_budget)
    sys.setrecursionlimit(max(sys.getrecursionlimit(), depth_budget * 8))


def serialize(segment):
    children = [serialize(child) for child in segment.segments if not child.is_meta]
    if children:
        return {"kind": segment.get_type(), "children": children}
    kind = segment.get_type()
    text = segment.raw
    if kind == "inline_comment":
        # The lexer can include the CR of a CRLF in the comment token.
        text = text.removesuffix("\r")
    return {"kind": kind, "text": text}


def main():
    if sys.argv[1] == "--dialects":
        print(json.dumps([dialect.label for dialect in dialect_readout()]))
        return 0

    dialect = sys.argv[2]
    try:
        config = FluffConfig(overrides={"dialect": dialect, "templater": "raw"})
    except (KeyError, SQLFluffUserError):
        print(f"Unsupported SQL dialect: {dialect}", file=sys.stderr)
        return 2

    if dialect == "tsql":
        # The dialect object is process-local to the bridge invocation.
        extend_tsql(config.get("dialect_obj"))

    # Read bytes directly so universal newline handling doesn't change literals.
    sql = sys.stdin.buffer.read().decode("utf-8")
    if not sql.strip():
        print("Input does not contain any SQL.", file=sys.stderr)
        return 1

    tokens, errors = Lexer(config=config).lex(sql)
    if errors:
        for error in errors:
            print(f"Line {error.line_no}, column {error.line_pos}: {error}", file=sys.stderr)
        return 1

    configure_parser_limits(config, len(tokens))
    try:
        tree = Parser(config=config).parse(tokens)
    except SQLParseError as error:
        print(error, file=sys.stderr)
        return 1
    except RecursionError:
        print("SQL nesting exceeds the parser stack limit.", file=sys.stderr)
        return 1

    if tree is None:
        print("Input does not contain any SQL.", file=sys.stderr)
        return 1

    unparsable = list(tree.iter_unparsables())
    if unparsable:
        for segment in unparsable:
            line, column = segment.pos_marker.source_position()
            print(f"Line {line}, column {column}: {segment.raw[:100]!r}", file=sys.stderr)
        return 1

    if dialect == "tsql":
        for timer in tree.recursive_crawl("begin_conversation_timer_statement"):
            subquery = next(timer.recursive_crawl("select_statement", "set_expression"), None)
            if subquery is not None:
                line, column = subquery.pos_marker.source_position()
                print(f"Line {line}, column {column}: a conversation timer cannot use a subquery.", file=sys.stderr)
                return 1

    print(json.dumps(serialize(tree)))
    return 0


if __name__ == "__main__":
    sys.exit(main())

