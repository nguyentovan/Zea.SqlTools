"""Additional SQLFluff grammar for documented Transact-SQL statement forms."""

from sqlfluff.core.parser import (
    AnyNumberOf,
    BaseSegment,
    Bracketed,
    Delimited,
    OneOf,
    Ref,
    Sequence,
    StringParser,
)
from sqlfluff.core.parser.segments import IdentifierSegment, KeywordSegment


def extend_tsql_statements(dialect):
    """Extend the process-local SQLFluff T-SQL dialect."""
    extend_cursor_read_only(dialect)
    extend_data_types(dialect)
    extend_contextual_identifiers(dialect)
    extend_execute_parameters(dialect)
    extend_service_broker(dialect)


def extend_cursor_read_only(dialect):
    # SQL Server recognizes the two-word ISO spelling (engine error 1058).
    original = dialect.get_segment("CursorForClauseSegment")

    class CursorForClauseSegment(original):
        match_grammar = OneOf(original.match_grammar, Sequence("FOR", "READ", "ONLY"))

    dialect.replace(CursorForClauseSegment=CursorForClauseSegment)


def extend_data_types(dialect):
    # https://learn.microsoft.com/sql/t-sql/data-types/data-type-synonyms-transact-sql
    original = dialect.get_segment("DatatypeSegment")

    class DatatypeSegment(original):
        match_grammar = OneOf(Sequence("NATIONAL", "TEXT"), original.match_grammar)

    dialect.replace(DatatypeSegment=DatatypeSegment)


def extend_contextual_identifiers(dialect):
    # DEFINITION is contextual, not reserved by SQL Server. It is also a
    # documented column name of the sys.check_constraints catalog view.
    original = dialect.ref("NakedIdentifierSegment")
    definition = StringParser("DEFINITION", IdentifierSegment, type="naked_identifier")
    dialect.replace(NakedIdentifierSegment=OneOf(original, definition))


def extend_execute_parameters(dialect):
    # https://learn.microsoft.com/sql/t-sql/language-elements/execute-transact-sql
    # Match OUT as a keyword only after a variable in a static EXEC argument.
    # Keep the existing procedure targets and dynamic EXEC alternatives.
    original = dialect.get_segment("ExecuteScriptSegment")
    static_call = original._execute_stored_procedure_or_function
    argument_groups = next(
        child for child in static_call._elements if type(child) is AnyNumberOf
    )
    arguments = next(
        child for child in argument_groups._elements if isinstance(child, Delimited)
    )
    (argument,) = arguments._elements
    _, argument_value = argument._elements
    variable = next(
        child for child in argument_value._elements if isinstance(child, Sequence)
    )
    _, output_suffix = variable._elements

    def replace_child(parent, child, replacement):
        return parent.copy(insert=[replacement], before=child, remove=[child])

    updated_variable = replace_child(variable, output_suffix, OneOf("OUT", "OUTPUT", optional=True))
    updated_value = replace_child(argument_value, variable, updated_variable)
    updated_arguments = replace_child(arguments, argument, replace_child(argument, argument_value, updated_value))
    updated_groups = replace_child(argument_groups, arguments, updated_arguments)
    updated_static_call = replace_child(static_call, argument_groups, updated_groups)
    _, call = original.match_grammar._elements
    updated_call = replace_child(call, static_call, updated_static_call)

    class ExecuteScriptSegment(original):
        match_grammar = replace_child(original.match_grammar, call, updated_call)

    dialect.replace(ExecuteScriptSegment=ExecuteScriptSegment)


def contextual_keyword(text):
    return StringParser(text, KeywordSegment)


def extend_service_broker(dialect):
    qualified_name = Ref("ObjectReferenceSegment")
    service_name = Ref("SingleIdentifierGrammar")
    parameter = Ref("ParameterNameSegment")
    string_literal = Ref("QuotedLiteralSegmentOptWithN")
    equals = Ref("EqualsSegment")
    integer = Ref("IntegerLiteralSegment")
    expression = Ref("ExpressionSegment")
    switch = OneOf("ON", "OFF")
    handle = OneOf(parameter, string_literal)

    # https://learn.microsoft.com/sql/t-sql/statements/create-queue-transact-sql
    class CreateQueueStatementSegment(BaseSegment):
        type = "create_queue_statement"
        match_grammar = Sequence(
            "CREATE",
            "QUEUE",
            qualified_name,
            Sequence(
                "WITH",
                Delimited(
                    Sequence(OneOf(contextual_keyword("STATUS"), contextual_keyword("RETENTION")), equals, switch),
                    Sequence(
                        contextual_keyword("ACTIVATION"),
                        Bracketed(
                            Delimited(
                                Sequence(contextual_keyword("STATUS"), equals, switch),
                                Sequence(contextual_keyword("PROCEDURE_NAME"), equals, qualified_name),
                                Sequence(contextual_keyword("MAX_QUEUE_READERS"), equals, integer),
                                Sequence("EXECUTE", "AS", OneOf("SELF", "OWNER", string_literal)),
                            )
                        ),
                    ),
                    Sequence(
                        contextual_keyword("POISON_MESSAGE_HANDLING"),
                        Bracketed(contextual_keyword("STATUS"), equals, switch),
                    ),
                ),
                optional=True,
            ),
            Sequence("ON", OneOf("DEFAULT", service_name), optional=True),
        )

    # https://learn.microsoft.com/sql/t-sql/statements/begin-dialog-conversation-transact-sql
    class BeginDialogStatementSegment(BaseSegment):
        type = "begin_dialog_statement"
        match_grammar = Sequence(
            "BEGIN",
            contextual_keyword("DIALOG"),
            Ref.keyword("CONVERSATION", optional=True),
            parameter,
            "FROM",
            "SERVICE",
            service_name,
            "TO",
            "SERVICE",
            string_literal,
            Sequence(Ref("CommaSegment"), string_literal, optional=True),
            Sequence("ON", "CONTRACT", service_name, optional=True),
            Sequence(
                "WITH",
                Delimited(
                    Sequence(OneOf(contextual_keyword("RELATED_CONVERSATION"), contextual_keyword("RELATED_CONVERSATION_GROUP")), equals, handle),
                    Sequence(contextual_keyword("LIFETIME"), equals, expression),
                    Sequence("ENCRYPTION", equals, switch),
                ),
                optional=True,
            ),
        )

    # https://learn.microsoft.com/sql/t-sql/statements/send-transact-sql
    class SendStatementSegment(BaseSegment):
        type = "send_statement"
        match_grammar = Sequence(
            "SEND",
            "ON",
            "CONVERSATION",
            OneOf(handle, Bracketed(Delimited(handle))),
            Sequence("MESSAGE", "TYPE", service_name, optional=True),
            Bracketed(expression, optional=True),
        )

    # https://learn.microsoft.com/sql/t-sql/statements/receive-transact-sql
    class ReceiveStatementSegment(BaseSegment):
        type = "receive_statement"
        match_grammar = Sequence(
            "RECEIVE",
            Sequence("TOP", Bracketed(expression), optional=True),
            OneOf(
                Ref("StarSegment"),
                Delimited(Ref("SelectClauseElementSegment")),
            ),
            "FROM",
            qualified_name,
            Sequence("INTO", parameter, optional=True),
            Sequence(
                "WHERE",
                OneOf(contextual_keyword("CONVERSATION_HANDLE"), contextual_keyword("CONVERSATION_GROUP_ID")),
                equals,
                handle,
                optional=True,
            ),
        )

    # https://learn.microsoft.com/sql/t-sql/statements/get-conversation-group-transact-sql
    class GetConversationGroupStatementSegment(BaseSegment):
        type = "get_conversation_group_statement"
        match_grammar = Sequence("GET", "CONVERSATION", "GROUP", parameter, "FROM", qualified_name)

    # https://learn.microsoft.com/sql/t-sql/statements/begin-conversation-timer-transact-sql
    class BeginConversationTimerStatementSegment(BaseSegment):
        type = "begin_conversation_timer_statement"
        match_grammar = Sequence("BEGIN", "CONVERSATION", contextual_keyword("TIMER"), Bracketed(handle), "TIMEOUT", equals, expression)

    existing_wait = dialect.get_segment("WaitForStatementSegment")

    class WaitForStatementSegment(existing_wait):
        match_grammar = OneOf(
            existing_wait.match_grammar,
            Sequence(
                "WAITFOR",
                Bracketed(OneOf(Ref("ReceiveStatementSegment"), Ref("GetConversationGroupStatementSegment"))),
                Sequence(
                    Ref("CommaSegment"),
                    "TIMEOUT",
                    OneOf(parameter, Sequence(Ref("NegativeSegment", optional=True), integer)),
                    optional=True,
                ),
            ),
        )

    extra_segments = (
        CreateQueueStatementSegment,
        BeginDialogStatementSegment,
        SendStatementSegment,
        ReceiveStatementSegment,
        GetConversationGroupStatementSegment,
        BeginConversationTimerStatementSegment,
    )
    dialect.add(**{segment.__name__: segment for segment in extra_segments})

    original = dialect.get_segment("StatementSegment")

    class StatementSegment(original):
        match_grammar = original.match_grammar.copy(
            insert=[Ref(segment.__name__) for segment in extra_segments],
        )

    dialect.replace(
        StatementSegment=StatementSegment,
        WaitForStatementSegment=WaitForStatementSegment,
    )
