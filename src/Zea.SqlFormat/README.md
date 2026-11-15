# Zea.SqlFormat

Zea parses SQL with SQLFluff and formats it with Right Way. SQL is read from stdin and formatted SQL is written to stdout. The dialect labels come from the installed SQLFluff version.

## Install the parser

Install SQLFluff into a Python environment. The formatter has been tested with SQLFluff 4.5.0 and Python 3.13. To use a local SQLFluff checkout from PowerShell:

```powershell
uv venv obj/sqlfluff-venv --python 3.13
uv pip install --python obj/sqlfluff-venv/Scripts/python.exe D:/Documents/Workspaces/sqlfluff-main
$env:ZEA_SQLFLUFF_PYTHON = (Resolve-Path obj/sqlfluff-venv/Scripts/python.exe).Path
dotnet build Zea.SqlTools.slnx
```

Set `ZEA_SQLFLUFF_PYTHON` to the Python executable with SQLFluff installed. When the variable is unset, Zea uses `python` from PATH. The build and publish output include the Python bridge.

## Publish a standalone Windows x64 EXE

From the repository root, use PowerShell 7 and the .NET 10 SDK. Prepare
the Python environment above, then run:

```powershell
./Publish-ZeaSqlFormat.ps1
```

The script packages the Python embeddable runtime and the installed
SQLFluff environment. Copy `obj/portable/win-x64/Zea.SqlFormat.exe` to
the target Windows x64 machine. The EXE contains .NET, Python and SQLFluff
and extracts its runtime files into a user-writable cache at launch.
Use `-PythonEnvironment` when the build environment is located elsewhere.

```powershell
$exe = '.\obj\portable\win-x64\Zea.SqlFormat.exe'
& $exe --dialects
'select 1::int, 2 limit 3' | & $exe --dialect postgres
```

## Run and test

```powershell
$app = 'src/Zea.SqlFormat/bin/Debug/net10.0/Zea.SqlFormat.dll'
dotnet $app --dialects
'select 1::int, 2 limit 3' | dotnet $app --dialect postgres
./Test-SqlFormatting.ps1
```

The integration tests cover T-SQL, PostgreSQL, MySQL, Oracle and SQLite. Other labels can be discovered with `--dialects`. Formatting coverage depends on how Right Way handles the SQLFluff parse tree for the constructs in the input.

## Run the dialect corpora

Run this command from the repository root after publishing the portable formatter.

    ./obj/sqlfluff-venv/Scripts/python.exe -B tests/run_sql_dialect_corpora.py obj/portable/win-x64/Zea.SqlFormat.exe

Each SQL file contains independent cases. The runner compares manually specified
layouts, formats successful output again, and checks dialect-specific syntax
against the other dialects. The JSON report lists every discrepancy and the
command exits with code 1 when a check fails.

## Third-party attribution

Zea vendors the core library from [Right Way SQL Formatter](https://github.com/BadMonkeySoftware/right-way-sql-formatter), based on Poor Man's T-SQL Formatter by Tao Klerks. The vendored files retain their original notices and are licensed under the [GNU Affero General Public License v3](Formatters/RightWay/LICENSE.txt).

SQLFluff parses every CLI dialect, including T-SQL. SqlFluffTreeAdapter converts the parse tree for RightWayFormatter. The SQL Server keyword table supplies formatting metadata for built-in function casing and identifier checks.
