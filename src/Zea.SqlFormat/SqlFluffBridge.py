"""Expose SQLFluff's lexer and parser without applying settings from SQL input."""

import json
import runpy
import sys
from bisect import bisect_left
from pathlib import Path

from sqlfluff.core import FluffConfig, SQLFluffUserError
from sqlfluff.core.dialects import dialect_readout
from sqlfluff.core.errors import SQLParseError
from sqlfluff.core.parser import Lexer, Nothing, Parser, Ref, RegexLexer, Sequence


def keep_block_comments_together(dialect):
    # SQLFluff normally splits block comments into pieces so its linter can
    # indent each line. The Right Way renderer needs the original whole token.
    original = next(matcher for matcher in dialect.get_lexer_matchers() if matcher.name == "block_comment")
    dialect.patch_lexer_matchers([
        RegexLexer(original.name, original.template, original.segment_class, segment_kwargs=original.segment_kwargs)
    ])


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
        Sequence,
        StringParser,
    )
    from sqlfluff.core.parser.segments import KeywordSegment

    keep_block_comments_together(dialect)

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

    apply_extension(dialect, "SqlFluffTsqlStatements.py", "extend_tsql_statements")


def apply_extension(dialect, filename, entrypoint):
    extension = runpy.run_path(str(Path(__file__).with_name(filename)))
    extension[entrypoint](dialect)


def extend_oracle(dialect):
    # PL/SQL retains its own statement grammar for procedure calls.
    original = dialect.get_segment("StatementSegment")

    class StatementSegment(original):
        match_grammar = original.match_grammar.copy(remove=[Ref("FunctionSegment")])

    dialect.replace(
        StatementSegment=StatementSegment,
        StatementAndDelimiterGrammar=Sequence(
            Ref("PlsqlStatementSegment", exclude=Ref.keyword("ELSIF")),
            Ref("DelimiterGrammar"),
        ),
    )
    apply_extension(dialect, "SqlFluffOracleQueries.py", "extend_oracle_queries")
    apply_extension(dialect, "SqlFluffOracleDdl.py", "extend_oracle_ddl")
    apply_extension(dialect, "SqlFluffOracleProcedural.py", "extend_oracle_procedural")
    apply_extension(dialect, "SqlFluffOracleAnalytics.py", "extend_oracle_analytics")


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


def sqlite_result_expressions(tree):
    for segment in tree.recursive_crawl("select_clause_element", "returning_clause"):
        if segment.is_type("select_clause_element"):
            if segment.get_child("alias_expression", "wildcard_expression") is None:
                yield segment
            continue

        # SQLFluff exposes each RETURNING expression and its optional alias as siblings.
        following_kind = None
        for part in reversed(segment.segments):
            if not part.is_code:
                continue
            if part.is_type("expression") and following_kind != "alias_expression":
                yield part
            following_kind = part.get_type()


def sqlite_column_metadata_segments(tree):
    for column in tree.recursive_crawl("column_definition"):
        data_type = column.get_child("data_type")
        if data_type is not None:
            suffix = ()
            following = column.segments[column.segments.index(data_type) + 1:]
            for index, part in enumerate(following):
                if part.is_code:
                    # SQLFluff can attach type parameters to the column instead
                    # of the data type, e.g. for a multiword declared type.
                    if part.is_type("bracketed"):
                        suffix = following[:index + 1]
                    break
            yield data_type, suffix

        for constraint in column.get_children("column_constraint_segment"):
            # A DEFAULT can follow an optional CONSTRAINT name, and its value
            # is one expression segment in the SQLite grammar.
            parts = [part for part in constraint.segments if part.is_code]
            if len(parts) >= 2 and parts[-2].is_type("keyword") and parts[-2].raw_upper == "DEFAULT":
                yield parts[-1], ()


def sqlite_preserved_spans(tree, sql):
    # SQLite can name an unaliased column using its SQL text up to the next
    # syntax token, including trailing comments that SQLFluff attaches elsewhere.
    tokens = [part for part in tree.raw_segments if not part.is_meta and part.raw]
    starts = [part.pos_marker.source_slice.start for part in tokens]
    directives = ("[NOFORMAT]", "[/NOFORMAT]", "[MINIFY]", "[/MINIFY]")
    directive_starts = [
        start for start, part in zip(starts, tokens)
        if part.is_type("block_comment") and part.raw.endswith("*/")
        and any(marker in part.raw_upper for marker in directives)
    ]
    def overlaps_directive(start, end):
        index = bisect_left(directive_starts, start)
        return index < len(directive_starts) and directive_starts[index] < end

    spans = {}
    absorbed_segments = set()
    for metadata, suffix in sqlite_column_metadata_segments(tree):
        start = metadata.pos_marker.source_slice.start
        last = suffix[-1] if suffix else metadata
        end = last.pos_marker.source_slice.stop
        if overlaps_directive(start, end):
            return None
        # SQLite exposes the spelling of declared types and DEFAULT expressions.
        spans[id(metadata)] = sql[start:end]
        absorbed_segments.update(id(part) for part in suffix)

    for expression in sqlite_result_expressions(tree):
        span = expression.pos_marker.source_slice
        end = span.stop
        first = bisect_left(starts, end)
        last_comment = None
        next_index = first
        while next_index < len(tokens) and not tokens[next_index].is_code:
            part = tokens[next_index]
            if part.is_comment:
                last_comment = part
            next_index += 1

        if last_comment is not None:
            end = last_comment.pos_marker.source_slice.stop
            # Preserve the first terminating newline for a line comment followed
            # by SQL so a comma, closing bracket, or keyword stays outside it.
            if last_comment.is_type("inline_comment") and next_index < len(tokens):
                newline = sql.find("\n", end, starts[next_index])
                if newline >= 0:
                    end = newline + 1
            for part in tokens[first:next_index]:
                if part.pos_marker.source_slice.stop <= end:
                    absorbed_segments.add(id(part))
        if overlaps_directive(span.start, end):
            # A directive inside a protected span must stay with the original SQL.
            return None

        text = sql[span.start:end]
        if last_comment is not None and last_comment.is_type("inline_comment") and next_index == len(tokens):
            text = text.removesuffix("\r")
        spans[id(expression)] = text
    return spans, absorbed_segments


def serialize(segment, preserved_spans=None, absorbed_segments=frozenset()):
    if preserved_spans and id(segment) in preserved_spans:
        return {"kind": "sqlite_preserved_text", "text": preserved_spans[id(segment)]}
    children = [
        serialize(child, preserved_spans, absorbed_segments)
        for child in segment.segments
        if not child.is_meta and (not absorbed_segments or id(child) not in absorbed_segments)
    ]
    kind = segment.get_type()
    if children:
        return {"kind": kind, "children": children}
    text = segment.raw
    if kind == "inline_comment":
        # The lexer can include the CR of a CRLF in the comment token.
        text = text.removesuffix("\r")
    return {"kind": kind, "text": text}


def invalid_implicit_execute(tree):
    """Return the first invalid implicit EXEC and its syntax diagnostic."""
    # EXEC is optional only for the first statement in a T-SQL batch.
    # A SQLFluff batch segment alone is not a separator. Only GO starts a new batch.
    allowed_calls = set()
    at_batch_start = True
    for batch in tree.get_children("batch"):
        statement = batch.get_child("statement")
        if statement is not None:
            if at_batch_start:
                call = statement.get_child("execute_script_statement")
                if call is not None:
                    allowed_calls.add(id(call))
            at_batch_start = False
        if batch.get_child("go_statement") is not None:
            at_batch_start = True

    for call in tree.recursive_crawl("execute_script_statement"):
        first = next(segment for segment in call.segments if segment.is_code)
        if first.is_type("keyword") and first.raw_upper in {"EXEC", "EXECUTE"}:
            continue
        if id(call) not in allowed_calls:
            return call, "EXEC or EXECUTE is required for a procedure call outside the first statement of a batch."

        # A procedure parameter value cannot be a function call or a computed expression.
        for argument in call.get_children("expression"):
            parts = [part for part in argument.segments if part.is_code]
            if len(parts) != 1 or parts[0].is_type("bracketed", "function"):
                return argument, "An implicit procedure argument must be a constant or a variable."
    return None


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
    elif dialect == "postgres":
        keep_block_comments_together(config.get("dialect_obj"))
    elif dialect in ("mysql", "oracle", "sqlite"):
        # These dialects inherit the ANSI parser's PostgreSQL-style cast rule.
        dialect_obj = config.get("dialect_obj")
        dialect_obj.replace(ShorthandCastSegment=Nothing())
        keep_block_comments_together(dialect_obj)
        if dialect == "mysql":
            apply_extension(dialect_obj, "SqlFluffMySql.py", "extend_mysql")
        elif dialect == "oracle":
            extend_oracle(dialect_obj)
        elif dialect == "sqlite":
            original = dialect_obj.get_segment("ExplainStatementSegment")

            class ExplainStatementSegment(original):
                match_grammar = Sequence(
                    "EXPLAIN", Sequence("QUERY", "PLAN", optional=True), original.explainable_stmt
                )

            dialect_obj.replace(ExplainStatementSegment=ExplainStatementSegment)

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
        invalid_call = invalid_implicit_execute(tree)
        if invalid_call is not None:
            segment, message = invalid_call
            line, column = segment.pos_marker.source_position()
            print(f"Line {line}, column {column}: {message}", file=sys.stderr)
            return 1

        for timer in tree.recursive_crawl("begin_conversation_timer_statement"):
            subquery = next(timer.recursive_crawl("select_statement", "set_expression"), None)
            if subquery is not None:
                line, column = subquery.pos_marker.source_position()
                print(f"Line {line}, column {column}: a conversation timer cannot use a subquery.", file=sys.stderr)
                return 1

    if dialect == "sqlite":
        spans = sqlite_preserved_spans(tree, sql)
        if spans is None:
            serialized = {"kind": "verbatim_sqlite"}
        else:
            preserved_spans, absorbed_segments = spans
            serialized = serialize(tree, preserved_spans, absorbed_segments)
    else:
        serialized = serialize(tree)
    print(json.dumps(serialized))
    return 0


if __name__ == "__main__":
    sys.exit(main())

