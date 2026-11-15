param(
    [string] $PythonEnvironment = (Join-Path $PSScriptRoot 'obj/sqlfluff-venv')
)

$ErrorActionPreference = 'Stop'
$PSNativeCommandUseErrorActionPreference = $false

if (![OperatingSystem]::IsWindows()) {
    throw 'Run this publish script on Windows with an x64 Python environment.'
}

$project = Join-Path $PSScriptRoot 'src/Zea.SqlFormat/Zea.SqlFormat.csproj'
$portableRoot = Join-Path $PSScriptRoot 'obj/portable'
$work = Join-Path $portableRoot ("work-" + [Guid]::NewGuid().ToString('N'))
$runtime = Join-Path $work 'python'
$distribution = Join-Path $portableRoot 'win-x64'
New-Item -ItemType Directory -Path $work -Force | Out-Null

$sourcePython = Join-Path $PythonEnvironment 'Scripts/python.exe'
if (!(Test-Path -LiteralPath $sourcePython -PathType Leaf)) {
    throw "Python environment not found at $PythonEnvironment. See src/Zea.SqlFormat/README.md."
}

$sourceInfo = & $sourcePython -I -X utf8 -c 'import importlib.metadata, json, platform, sys, sysconfig; print(json.dumps(dict(python=list(sys.version_info[:2]), architecture=platform.machine(), implementation=platform.python_implementation(), packages=sysconfig.get_path("purelib"), sqlfluff=importlib.metadata.version("sqlfluff"))))'
if ($LASTEXITCODE -ne 0) {
    throw 'Could not inspect the Python environment. It must contain SQLFluff.'
}
$sourceInfo = $sourceInfo | ConvertFrom-Json
if (($sourceInfo.python -join '.') -ne '3.13' -or $sourceInfo.architecture -ne 'AMD64' -or
    $sourceInfo.implementation -ne 'CPython') {
    throw 'The Python environment must run CPython 3.13 on Windows x64.'
}

$archiveName = 'python-3.13.14-embed-amd64.zip'
$archive = Join-Path $portableRoot $archiveName
$archiveHash = '90B4E5B9898B72D744650524BFF92377C367F44BD5FBD09E3148656C080AD907'
if ((Test-Path -LiteralPath $archive -PathType Leaf) -and
    (Get-FileHash -LiteralPath $archive -Algorithm SHA256).Hash -eq $archiveHash) {
    Expand-Archive -LiteralPath $archive -DestinationPath $runtime
}
else {
    $download = Join-Path $work $archiveName
    Invoke-WebRequest -Uri "https://www.python.org/ftp/python/3.13.14/$archiveName" -OutFile $download
    if ((Get-FileHash -LiteralPath $download -Algorithm SHA256).Hash -ne $archiveHash) {
        throw 'Unexpected SHA-256 for the official Python embeddable archive.'
    }

    Copy-Item -LiteralPath $download -Destination $archive -Force
    Expand-Archive -LiteralPath $download -DestinationPath $runtime
}

$packages = Join-Path $runtime 'site-packages'
& robocopy.exe $sourceInfo.packages $packages /E /XD __pycache__ /XF *.pyc _virtualenv.py _virtualenv.pth direct_url.json /R:1 /W:1 /NFL /NDL /NJH /NJS /NP
if ($LASTEXITCODE -ge 8) {
    throw "Could not copy the SQLFluff environment (robocopy exit $LASTEXITCODE)."
}

$pathFile = Join-Path $runtime 'python313._pth'
[IO.File]::WriteAllLines($pathFile, @('python313.zip', '.', 'site-packages'), [Text.Encoding]::ASCII)

$bundlePython = Join-Path $runtime 'python.exe'
$installedVersion = & $bundlePython -I -B -X utf8 -c 'import importlib.metadata; from sqlfluff.core import FluffConfig; print(importlib.metadata.version("sqlfluff"))'
if ($LASTEXITCODE -ne 0 -or $installedVersion -ne $sourceInfo.sqlfluff) {
    throw 'The packaged Python runtime could not load the expected SQLFluff version.'
}

$publish = Join-Path $work 'publish'
$artifacts = Join-Path $work 'dotnet'
dotnet publish $project --configuration Release --artifacts-path $artifacts --output $publish "-p:PortablePythonRoot=$runtime" --nologo
if ($LASTEXITCODE -ne 0) {
    throw 'Portable publish failed.'
}

$items = @(Get-ChildItem -LiteralPath $publish -Force)
if ($items.Count -ne 1 -or $items[0].Name -ne 'Zea.SqlFormat.exe') {
    throw 'Expected the publish directory to contain only Zea.SqlFormat.exe.'
}

# Run from a clean bundle cache and a PATH without Python or .NET.
$variables = @('Path', 'ZEA_SQLFLUFF_PYTHON', 'PYTHONHOME', 'PYTHONPATH', 'DOTNET_ROOT', 'DOTNET_BUNDLE_EXTRACT_BASE_DIR')
$saved = @{}
foreach ($name in $variables) {
    $saved[$name] = [Environment]::GetEnvironmentVariable($name)
}

try {
    $empty = Join-Path $work 'unavailable'
    $env:Path = Join-Path $env:SystemRoot 'System32'
    $env:ZEA_SQLFLUFF_PYTHON = Join-Path $empty 'python.exe'
    $env:PYTHONHOME = $empty
    $env:PYTHONPATH = $empty
    $env:DOTNET_ROOT = $empty
    $env:DOTNET_BUNDLE_EXTRACT_BASE_DIR = Join-Path $work 'test-extraction'

    $exe = $items[0].FullName
    $dialects = @(& $exe --dialects)
    if ($LASTEXITCODE -ne 0 -or 'tsql' -notin $dialects -or 'postgres' -notin $dialects) {
        throw 'The standalone EXE could not list its bundled SQLFluff dialects.'
    }

    $output = 'select 1::int,2 limit 3' | & $exe --dialect postgres
    $expected = @('SELECT 1::INT', '    ,2', 'LIMIT 3') -join [char]10
    if ($LASTEXITCODE -ne 0 -or ($output -join [char]10) -cne $expected) {
        throw 'The standalone EXE failed its formatting smoke test.'
    }
}
finally {
    foreach ($name in $variables) {
        [Environment]::SetEnvironmentVariable($name, $saved[$name])
    }
}

New-Item -ItemType Directory -Path $distribution -Force | Out-Null
$unexpected = @(Get-ChildItem -LiteralPath $distribution -Force | Where-Object Name -ne 'Zea.SqlFormat.exe')
if ($unexpected.Count -gt 0) {
    throw "The distribution directory contains unrelated files: $distribution"
}

$destination = Join-Path $distribution 'Zea.SqlFormat.exe'
[IO.File]::Move($exe, $destination, $true)

$resolvedRoot = (Resolve-Path -LiteralPath $portableRoot).Path
$resolvedWork = (Resolve-Path -LiteralPath $work).Path
$workEntry = Get-Item -LiteralPath $resolvedWork
if ((Split-Path -Parent $resolvedWork) -ne $resolvedRoot -or
    $workEntry.Name -notmatch '^work-[a-f0-9]{32}$' -or
    ($workEntry.Attributes -band [IO.FileAttributes]::ReparsePoint)) {
    throw "Unexpected staging directory: $resolvedWork"
}

Remove-Item -LiteralPath $resolvedWork -Recurse
Get-Item -LiteralPath $destination

