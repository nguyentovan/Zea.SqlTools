$ErrorActionPreference = 'Stop'
$PSNativeCommandUseErrorActionPreference = $false

$project = Join-Path $PSScriptRoot 'Zea.SqlLogConvert.csproj'
dotnet build $project --nologo
if ($LASTEXITCODE -ne 0) {
    throw 'Build failed.'
}

$app = Join-Path $PSScriptRoot 'bin/Debug/net10.0/Zea.SqlLogConvert.dll'
$log = @"
DEBUG - PreparedStatement : [select @param0, @PARAM1, @param10]
DEBUG - Parameters: [@param0=[NAME,O'Brien], @param1=[ID,42], @param10=[DELETED_AT,null]]
DEBUG - Types: [@param0=[String, System.String], @param1=[Int32, System.Int32], @param10=[System.DBNull, null]]
"@
$expectedSql = "select 'O''Brien', 42, null"

$sql = $log | dotnet $app
if ($LASTEXITCODE -ne 0 -or $sql -cne $expectedSql) {
    throw 'Expected converted SQL on stdout from piped log input.'
}

$output = $log | dotnet $app 'input.log' 2>&1
if ($LASTEXITCODE -ne 2 -or $output -isnot [System.Management.Automation.ErrorRecord]) {
    throw 'Expected a path argument to fail with exit code 2 and only stderr.'
}

$helpText = dotnet $app --help
if ($LASTEXITCODE -ne 0 -or (($helpText -join ' ') -notmatch 'stdin' -or ($helpText -join ' ') -match '\bfile\b')) {
    throw 'Expected help to document stdin as the only input.'
}

foreach ($invalidLog in '', 'DEBUG - unrelated log', ($log + [Environment]::NewLine + $log)) {
    $output = $invalidLog | dotnet $app 2>&1
    if ($LASTEXITCODE -eq 0 -or $output -isnot [System.Management.Automation.ErrorRecord]) {
        throw 'Expected a failed exit code and only stderr for invalid input.'
    }
}

Write-Output 'Passed 6 CLI checks.'
