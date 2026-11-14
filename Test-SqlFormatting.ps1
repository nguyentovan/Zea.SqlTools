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

$sql = 'select 1,2' | dotnet $app
Assert-FormattedSql $sql ("SELECT 1" + [char]10 + '    ,2') 'Expected the default Right Way comma layout.'

$sql = 'select 1 from t join u on 1=1' | dotnet $app
Assert-FormattedSql $sql ("SELECT 1" + [char]10 + 'FROM t' + [char]10 + 'INNER JOIN u ON 1 = 1') 'Expected default keyword standardization.'

$literal = "SELECT N'Ho$([char]0x00E0)ng; -- O''Brien'"
$sql = ("select" + $literal.Substring(6)) | dotnet $app
Assert-FormattedSql $sql $literal 'Expected the SQL string literal to preserve Unicode, case and escaping.'

foreach ($helpArg in '-h', '--help') {
    $helpText = dotnet $app $helpArg
    if ($LASTEXITCODE -ne 0 -or ($helpText -join ' ') -notmatch 'stdin.*stdout') {
        throw "Expected $helpArg to document stdin and stdout."
    }
}

$output = 'select 1' | dotnet $app 'input.sql' 2>&1
if ($LASTEXITCODE -ne 2 -or $output -isnot [System.Management.Automation.ErrorRecord]) {
    throw 'Expected a path argument to fail with exit code 2 and only stderr.'
}

foreach ($invalidSql in '', '   ', 'select 1)', "select 'unfinished") {
    $output = $invalidSql | dotnet $app 2>&1
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
$sql = $log | dotnet $converter | dotnet $app
Assert-FormattedSql $sql ("SELECT 'O''Brien'" + [char]10 + '    ,42') 'Expected converted SQL to pass directly into the formatter.'

Write-Output 'Passed 11 SQL formatting CLI checks.'
