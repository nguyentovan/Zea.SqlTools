$ErrorActionPreference = 'Stop'
$PSNativeCommandUseErrorActionPreference = $false

$solution = Join-Path $PSScriptRoot 'Zea.SqlTools.slnx'
dotnet build $solution --nologo
if ($LASTEXITCODE -ne 0) {
    throw 'Build failed.'
}

$app = Join-Path $PSScriptRoot 'src/Zea.SqlFormat/bin/Debug/net10.0/Zea.SqlFormat.dll'
$converter = Join-Path $PSScriptRoot 'src/Zea.SqlLogConvert/bin/Debug/net10.0/Zea.SqlLogConvert.dll'

function Assert-FormattedSql($actual, $expected, $message) {
    if ($LASTEXITCODE -ne 0 -or ($actual -join "`n").TrimEnd() -cne $expected) {
        throw "$message Exit code: $LASTEXITCODE. Output: $actual"
    }
}

$sql = 'select 1,2' | dotnet $app --dialect tsql
Assert-FormattedSql $sql ("SELECT 1" + [char]10 + '    ,2') 'Expected the T-SQL Right Way comma layout.'

$sql = 'select 1 from t join u on 1=1' | dotnet $app --dialect tsql
Assert-FormattedSql $sql ("SELECT 1" + [char]10 + 'FROM t' + [char]10 + 'INNER JOIN u ON 1 = 1') 'Expected default keyword standardization.'

$literal = "SELECT N'Ho$([char]0x00E0)ng; -- O''Brien'"
$sql = ("select" + $literal.Substring(6)) | dotnet $app --dialect tsql
Assert-FormattedSql $sql $literal 'Expected the SQL string literal to preserve Unicode, case and escaping.'

foreach ($helpArg in '-h', '--help') {
    $helpText = dotnet $app $helpArg
    if ($LASTEXITCODE -ne 0 -or ($helpText -join ' ') -notmatch 'stdin.*stdout') {
        throw "Expected $helpArg to document stdin and stdout."
    }
    if (($helpText -join ' ') -notmatch '--dialect tsql') {
        throw "Expected $helpArg to document --dialect tsql."
    }
}

$output = 'select 1' | dotnet $app 'input.sql' 2>&1
if ($LASTEXITCODE -ne 2 -or $output -isnot [System.Management.Automation.ErrorRecord]) {
    throw 'Expected a path argument to fail with exit code 2 and only stderr.'
}

foreach ($arguments in @(@(), @('--dialect'), @('--dialect', 'no-such-dialect'), @('--dialect', '--dialects'))) {
    $output = 'select 1' | dotnet $app @arguments 2>&1
    if ($LASTEXITCODE -ne 2 -or !$output -or ($output -join ' ') -notmatch '--dialect tsql') {
        throw "Expected exit code 2 and dialect usage for arguments [$arguments]."
    }
    foreach ($line in $output) {
        if ($line -isnot [System.Management.Automation.ErrorRecord]) {
            throw "Unexpected stdout for arguments [$arguments]."
        }
    }
}

foreach ($invalidSql in '', '   ', 'select 1)', "select 'unfinished", 'select from', 'merge dbo.a using dbo.b on dbo.a.id=dbo.b.id when matched then;') {
    $output = $invalidSql | dotnet $app --dialect tsql 2>&1
    $exitCode = $LASTEXITCODE
    if ($exitCode -ne 1 -or !$output) {
        throw "Expected failed exit code 1 and a diagnostic for input [$invalidSql]."
    }

    foreach ($line in $output) {
        if ($line -isnot [System.Management.Automation.ErrorRecord]) {
            throw "Unexpected stdout for input [$invalidSql]."
        }
    }

    if ($invalidSql.Length -gt 3 -and ($output -join ' ') -notmatch 'parse') {
        throw "Expected a parse diagnostic for input [$invalidSql]."
    }
}

$log = @"
DEBUG - PreparedStatement : [select @param0, @param1]
DEBUG - Parameters: [@param0=[NAME,O'Brien], @param1=[ID,42]]
DEBUG - Types: [@param0=[String, System.String], @param1=[Int32, System.Int32]]
"@
$sql = $log | dotnet $converter | dotnet $app --dialect tsql
Assert-FormattedSql $sql ("SELECT 'O''Brien'" + [char]10 + '    ,42') 'Expected converted SQL to pass directly into the formatter.'

$dialects = @(dotnet $app --dialects)
if ($LASTEXITCODE -ne 0) {
    throw 'Expected --dialects to list SQLFluff dialects.'
}
foreach ($dialect in 'tsql', 'postgres', 'mysql', 'oracle', 'sqlite', 'duckdb') {
    if ($dialects -notcontains $dialect) {
        throw "Missing SQLFluff dialect [$dialect]."
    }
}

$formatCases = @(
    @{ Dialect = 'postgres'; Input = 'select 1::int,2 limit 3'; Expected = @('SELECT 1::INT', '    ,2', 'LIMIT 3') }
    @{ Dialect = 'mysql'; Input = 'select `select`,2 from `table` limit 3'; Expected = @('SELECT `select`', '    ,2', 'FROM `table`', 'LIMIT 3') }
    @{ Dialect = 'oracle'; Input = 'select 1,2 from dual fetch first 3 rows only'; Expected = @('SELECT 1', '    ,2', 'FROM dual', 'FETCH FIRST 3 ROWS ONLY') }
    @{ Dialect = 'sqlite'; Input = 'select 1,2 limit 3 offset 1'; Expected = @('SELECT 1', '    ,2', 'LIMIT 3', 'OFFSET 1') }
)
foreach ($case in $formatCases) {
    $sql = $case.Input | dotnet $app --dialect $case.Dialect
    Assert-FormattedSql $sql ($case.Expected -join [char]10) "Expected Right Way output for $($case.Dialect)."
    $formattedAgain = $sql | dotnet $app --dialect $case.Dialect
    Assert-FormattedSql $formattedAgain ($case.Expected -join [char]10) "Expected stable output for $($case.Dialect)."

    $invalid = 'select )' | dotnet $app --dialect $case.Dialect 2>&1
    if ($LASTEXITCODE -ne 1 -or ($invalid -join ' ') -notmatch 'parse' -or
        @($invalid | Where-Object { $_ -isnot [System.Management.Automation.ErrorRecord] }).Count -ne 0) {
        throw "Expected a parse diagnostic on stderr for $($case.Dialect)."
    }
}

$tsqlRegressions = @(
    @{ Input = 'select 1 from t where b between 1 and 2'; Expected = @('SELECT 1', 'FROM t', 'WHERE b BETWEEN 1', '        AND 2') }
    @{ Input = 'delete from t where x is null'; Expected = @('DELETE', 'FROM t', 'WHERE x IS NULL') }
    @{ Input = 'begin select 1; select 2; end;'; Expected = @('BEGIN', '    SELECT 1;', '', '    SELECT 2;', 'END;') }
    @{ Input = 'select dbo.fn(x), coalesce(a,b) from t'; Expected = @('SELECT dbo.fn(x)', '    ,COALESCE(a, b)', 'FROM t') }
    @{ Input = 'select a from t left outer /*c*/ join u on t.id=u.id'; Expected = @('SELECT a', 'FROM t', 'LEFT JOIN /*c*/ u ON t.id = u.id') }
    @{ Input = 'select x from t cross /*c*/ join u'; Expected = @('SELECT x', 'FROM t', 'CROSS JOIN /*c*/ u') }
    @{ Input = 'select a into #t from dbo.t;'; Expected = @('SELECT a', 'INTO #t', 'FROM dbo.t;') }
    @{ Input = 'if 1=1 select 1; else select 2;'; Expected = @('IF 1 = 1', '    SELECT 1;', 'ELSE', '    SELECT 2;') }
    @{ Input = 'if 1=1 begin select 1; end else if 2=2 select 2;'; Expected = @('IF 1 = 1', 'BEGIN', '    SELECT 1;', 'END', 'ELSE IF 2 = 2', '    SELECT 2;') }
    @{ Input = 'while @i<3 begin set @i+=1; end;'; Expected = @('WHILE @i < 3', 'BEGIN', '    SET @i += 1;', 'END;') }
    @{ Input = 'begin try select 1; end try begin catch select error_message(); end catch;'; Expected = @('BEGIN TRY', '    SELECT 1;', 'END TRY', '', 'BEGIN CATCH', '    SELECT error_message();', 'END CATCH;') }
    @{ Input = 'create proc dbo.p @x int=0 as begin select @x; end;'; Expected = @('CREATE PROCEDURE dbo.p @x INT = 0', 'AS', 'BEGIN', '    SELECT @x;', 'END;') }
    @{
        Input = 'merge t using u on t.id=u.id when matched then update set t.x=u.x when not matched then insert (id,x) values (u.id,u.x);'
        Expected = @('MERGE t', 'USING u', '    ON t.id = u.id', 'WHEN MATCHED', '    THEN', '        UPDATE', '        SET t.x = u.x',
            'WHEN NOT MATCHED', '    THEN', '        INSERT (', '            id', '            ,x', '            )', '        VALUES (',
            '            u.id', '            ,u.x', '            );')
    }
    @{
        Input = 'merge t using u on t.id=u.id when matched then update set t.x=u.x when not matched then insert (id) values (u.id) output inserted.id;'
        Expected = @('MERGE t', 'USING u', '    ON t.id = u.id', 'WHEN MATCHED', '    THEN', '        UPDATE', '        SET t.x = u.x',
            'WHEN NOT MATCHED', '    THEN', '        INSERT (id)', '        VALUES (u.id)', 'OUTPUT inserted.id;')
    }
)
foreach ($case in $tsqlRegressions) {
    $sql = $case.Input | dotnet $app --dialect tsql
    Assert-FormattedSql $sql ($case.Expected -join [char]10) "Expected existing T-SQL output for $($case.Input)."
}

$oracle = (@('begin null; end;', '/') -join [char]10) | dotnet $app --dialect oracle
Assert-FormattedSql $oracle (@('BEGIN', '    NULL;', 'END;', '/') -join [char]10) 'Expected the Oracle block and SQL*Plus delimiter on separate lines.'

$oracle = "select q'[hi]' as t, :param from dual;" | dotnet $app --dialect oracle
Assert-FormattedSql $oracle (@("SELECT q'[hi]' AS t", '    ,:param', 'FROM dual;') -join [char]10) 'Expected the Oracle literal and bind variable to preserve their spelling.'

$sqlite = 'insert into t(id) values (?) on conflict(id) do nothing returning id;' | dotnet $app --dialect sqlite
Assert-FormattedSql $sqlite (@('INSERT INTO t (id)', 'VALUES (?)', 'ON CONFLICT (id) DO NOTHING', 'RETURNING id;') -join [char]10) 'Expected SQLite conflict and returning clauses on separate lines.'

$postgres = 'select a[1], arr[2][3] from t' | dotnet $app --dialect postgres
Assert-FormattedSql $postgres (@('SELECT a[1]', '    ,arr[2][3]', 'FROM t') -join [char]10) 'Expected PostgreSQL array accessors to stay adjacent.'

$continuedLiteral = (@("select concat('a'", "'b'), 'c'", "'d' as cd") -join [char]10) | dotnet $app --dialect postgres
Assert-FormattedSql $continuedLiteral (@("SELECT concat('a'", "'b')", "    ,'c'", "'d' AS cd") -join [char]10) 'Expected newlines between continued PostgreSQL string literals.'

$directive = (@('-- sqlfluff:dialect:oracle', 'select top (1) a from dbo.t') -join [char]10) | dotnet $app --dialect tsql
Assert-FormattedSql $directive (@('-- sqlfluff:dialect:oracle', 'SELECT TOP (1) a', 'FROM dbo.t') -join [char]10) 'Expected SQLFluff directives in SQL to remain comments.'

$comment = (@('select 1 # hello', ',2') -join [char]10) | dotnet $app --dialect mysql
Assert-FormattedSql $comment (@('SELECT 1 # hello', '    ,2') -join [char]10) 'Expected the MySQL inline comment to survive the output check on Windows.'

$literalSql = @('select $$A', ' B$$, 2') -join ([string][char]13 + [char]10)
$literalResult = $literalSql | dotnet $app --dialect postgresql
Assert-FormattedSql $literalResult (@('SELECT $$A', ' B$$', '    ,2') -join [char]10) 'Expected the PostgreSQL literal to survive formatting.'

$escapedIdentifier = 'select [a]]b], [with spaces] from dbo.t;' | dotnet $app --dialect tsql
Assert-FormattedSql $escapedIdentifier (@('SELECT [a]]b]', '    ,[with spaces]', 'FROM dbo.t;') -join [char]10) 'Expected T-SQL bracket escaping to survive.'

$namespaces = "with xmlnamespaces(default 'urn:demo', 'urn:x' as x) select id from dbo.t for xml path('row'),type;" | dotnet $app --dialect tsql
Assert-FormattedSql $namespaces (@("WITH xmlnamespaces (", "    DEFAULT 'urn:demo'", "    ,'urn:x' AS x", "    )", 'SELECT id', 'FROM dbo.t', "FOR XML path('row')", '    ,type;') -join [char]10) 'Expected XML namespace and serialization clauses.'

$identifierCase = 'select d.value from dbo.queue as d;' | dotnet $app --dialect tsql
Assert-FormattedSql $identifierCase (@('SELECT d.value', 'FROM dbo.queue AS d;') -join [char]10) 'Expected identifier casing to survive formatting for case-sensitive databases.'

$repeatBatch = (@('select 1;', 'GO 2', 'select 3;') -join [char]10) | dotnet $app --dialect tsql
Assert-FormattedSql $repeatBatch (@('SELECT 1;', 'GO 2', '', 'SELECT 3;') -join [char]10) 'Expected GO with a repeat count to stay on a separate line.'

$nestedCommentSql = @('/* outer', '  /* nested */', '  end of outer */', 'select 1;') -join [char]10
$nestedComment = $nestedCommentSql | dotnet $app --dialect tsql
Assert-FormattedSql $nestedComment (@('/* outer', '  /* nested */', '  end of outer */', 'SELECT 1;') -join [char]10) 'Expected a nested block comment to preserve its original text and lines.'

$leadingCommentSql = @('select 1;', '-- next statement', 'select 2;') -join [char]10
$leadingComment = $leadingCommentSql | dotnet $app --dialect tsql
Assert-FormattedSql $leadingComment (@('SELECT 1;', '', '-- next statement', 'SELECT 2;') -join [char]10) 'Expected a standalone comment to stay with the statement it introduces.'

$hintSql = 'select a from dbo.t(nolock) option (merge join, force order);'
$hint = $hintSql | dotnet $app --dialect tsql
Assert-FormattedSql $hint (@('SELECT a', 'FROM dbo.t(NOLOCK)', 'OPTION (', '    MERGE JOIN', '    ,FORCE ORDER', '    );') -join [char]10) 'Expected OPTION JOIN hints to preserve their syntax and legacy table hints to stay adjacent.'

$customType = 'declare @value dbo.SalesAmount;' | dotnet $app --dialect tsql
Assert-FormattedSql $customType 'DECLARE @value dbo.SalesAmount;' 'Expected the user-defined type name to preserve its case.'

$validBrokerSql = @(
    'create queue dbo.tasks with activation (procedure_name=dbo.StartTask, max_queue_readers=2, execute as owner);'
    'receive * from dbo.tasks where conversation_handle=@handle;'
    'waitfor (get conversation group @groupId from dbo.tasks), timeout -1;'
    'begin conversation timer (@handle) timeout = abs(-1);'
)
foreach ($sql in $validBrokerSql) {
    $formatted = $sql | dotnet $app --dialect tsql
    if ($LASTEXITCODE -ne 0 -or [string]::IsNullOrWhiteSpace($formatted -join "`n")) {
        throw "Expected valid Service Broker syntax to format. Input: $sql"
    }
}

$invalidBrokerSql = @(
    'create queue dbo.tasks with activation (procedure_name=dbo.StartTask, max_queue_readers=1.1, execute as owner);'
    'receive * from dbo.tasks where conversation_handle=(select 1);'
    'waitfor (get conversation group @groupId from dbo.tasks), timeout 1+2;'
    'waitfor (get conversation group @groupId from dbo.tasks), timeout +1;'
    'begin conversation timer (@handle) timeout = (select 1);'
)
foreach ($sql in $invalidBrokerSql) {
    $formatted = $sql | dotnet $app --dialect tsql 2>$null
    if ($LASTEXITCODE -ne 1 -or $formatted) {
        throw "Expected invalid Service Broker syntax to be rejected. Input: $sql"
    }
}

$trailingCommentRun = (@('select 1 -- first', '-- second', 'select 2;') -join [char]10) | dotnet $app --dialect tsql
Assert-FormattedSql $trailingCommentRun (@('SELECT 1 -- first', '    -- second', '', 'SELECT 2;') -join [char]10) 'Expected consecutive inline comments to stay with the preceding clause.'

$trailingBlockComment = (@('select 1;', '/* footer */') -join [char]10) | dotnet $app --dialect tsql
Assert-FormattedSql $trailingBlockComment (@('SELECT 1;', '    /* footer */') -join [char]10) 'Expected a final standalone block comment to keep its clause indentation.'

$outputInto = 'delete dbo.jobs output deleted.id into dbo.history(id) where id = 1;' | dotnet $app --dialect tsql
Assert-FormattedSql $outputInto (@('DELETE dbo.jobs', 'OUTPUT deleted.id', 'INTO dbo.history(id)', 'WHERE id = 1;') -join [char]10) 'Expected OUTPUT INTO target to start a new clause.'

$execOut = 'exec dbo.RunJob @a out, @b = @c output;' | dotnet $app --dialect tsql
Assert-FormattedSql $execOut (@('EXEC dbo.RunJob @a OUTPUT', '    ,@b = @c OUTPUT;') -join [char]10) 'Expected OUT to use the standard keyword in a procedure argument.'

$createOrAlter = "CREATE OR /* retain */ ALTER PROCEDURE p AS BEGIN PRINT 'x'; END;" | dotnet $app --dialect tsql
Assert-FormattedSql $createOrAlter (@('CREATE', '    OR /* retain */', '', 'ALTER PROCEDURE p', 'AS', 'BEGIN', "    PRINT 'x';", 'END;') -join [char]10) 'Expected CREATE OR ALTER to keep the comment after OR.'

$numericBoundary = 'SELECT 1empty;' | dotnet $app --dialect tsql
Assert-FormattedSql $numericBoundary 'SELECT 1e mpty;' 'Expected SQL Server exponent token boundaries to survive formatting.'

$bitShift = 'SELECT 1 << 2, 4 >> 1;' | dotnet $app --dialect tsql
Assert-FormattedSql $bitShift (@('SELECT 1 << 2', '    ,4 >> 1;') -join [char]10) 'Expected bit shift tokens to stay adjacent.'

$concat = "SELECT 'a'||'b';" | dotnet $app --dialect tsql
Assert-FormattedSql $concat "SELECT 'a' || 'b';" 'Expected the T-SQL string concatenation operator to stay adjacent.'

$emptyRegion = 'SELECT 1 /* [noformat] *//* [/noformat] */ FROM tab;' | dotnet $app --dialect tsql
Assert-FormattedSql $emptyRegion (@('SELECT 1 /* [noformat] */ /* [/noformat] */', 'FROM tab;') -join [char]10) 'Expected Right Way spacing for an empty inline format region.'

Write-Output 'Passed SQL formatting CLI checks for SQL Server, PostgreSQL, MySQL, Oracle and SQLite.'
