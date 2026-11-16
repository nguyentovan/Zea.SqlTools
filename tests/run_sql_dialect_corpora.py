"""Check Zea formatting and dialect boundaries without connecting to a database."""

import argparse
from collections import Counter
from concurrent.futures import ThreadPoolExecutor
from dataclasses import dataclass
import difflib
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import sys


ROOT = Path(__file__).resolve().parents[1]
# Preserve the cross-dialect matrix for the original five corpora.
BOUNDARY_CORPORA = {
    "tsql": "TsqlFormattingCorpus.sql",
    "postgres": "PostgreSqlFormattingCorpus.sql",
    "mysql": "MySqlFormattingCorpus.sql",
    "oracle": "OracleFormattingCorpus.sql",
    "sqlite": "SqliteFormattingCorpus.sql",
}
CORPORA = {
    **BOUNDARY_CORPORA,
    "ansi": "AnsiFormattingCorpus.sql",
    "athena": "AthenaFormattingCorpus.sql",
    "bigquery": "BigQueryFormattingCorpus.sql",
    "clickhouse": "ClickHouseFormattingCorpus.sql",
    "databricks": "DatabricksFormattingCorpus.sql",
    "db2": "Db2FormattingCorpus.sql",
    "doris": "DorisFormattingCorpus.sql",
    "duckdb": "DuckDbFormattingCorpus.sql",
    "exasol": "ExasolFormattingCorpus.sql",
    "flink": "FlinkFormattingCorpus.sql",
    "greenplum": "GreenplumFormattingCorpus.sql",
    "hive": "HiveFormattingCorpus.sql",
    "impala": "ImpalaFormattingCorpus.sql",
    "mariadb": "MariaDbFormattingCorpus.sql",
    "materialize": "MaterializeFormattingCorpus.sql",
    "redshift": "RedshiftFormattingCorpus.sql",
    "snowflake": "SnowflakeFormattingCorpus.sql",
    "soql": "SoqlFormattingCorpus.sql",
    "sparksql": "SparkSqlFormattingCorpus.sql",
    "starrocks": "StarRocksFormattingCorpus.sql",
    "teradata": "TeradataFormattingCorpus.sql",
    "trino": "TrinoFormattingCorpus.sql",
    "vertica": "VerticaFormattingCorpus.sql",
}
TSQL_EXCLUSIVE = {
    "advanced/09-01", "advanced/10-01", "ddl/03-01", "dml/02-01",
    "procedural/01-01", "procedural/04-01", "procedural/06-01",
    "procedural/08-01", "procedural/09-01",
}
SHARED = ("predicates/01-01",)
CASE_MARKER = re.compile(r"^-- zea-case: ([^\r\n]+)\r?\n", re.MULTILINE)
EXPECT_PREFIX = "-- zea-expect: "


@dataclass(frozen=True)
class Case:
    dialect: str
    name: str
    line: int
    sql: str
    expected_lines: list[str] | None
    exclusive: bool


def load_cases(dialect):
    path = ROOT / "tests" / CORPORA[dialect]
    source = path.read_bytes().decode("utf-8-sig")
    markers = list(CASE_MARKER.finditer(source))
    seen = set()
    cases = []
    for index, marker in enumerate(markers):
        name = marker[1].strip()
        if name in seen or "/" not in name:
            raise ValueError(f"{path}: invalid or duplicate case name {name}")
        seen.add(name)
        end = markers[index + 1].start() if index + 1 < len(markers) else len(source)
        body = source[marker.end():end]
        expected_lines = None
        if body.startswith(EXPECT_PREFIX):
            header, _, body = body.partition("\n")
            expected_lines = json.loads(header[len(EXPECT_PREFIX):])
            if not isinstance(expected_lines, list) or not all(isinstance(line, str) for line in expected_lines):
                raise ValueError(f"{path}: expected output for {name} must be a JSON array of lines")
        if not body.strip():
            raise ValueError(f"{path}: empty SQL for {name}")
        exclusive = name.startswith("exclusive/") or dialect == "tsql" and name in TSQL_EXCLUSIVE
        cases.append(Case(dialect, name, source.count("\n", 0, marker.start()) + 1,
                          body.rstrip("\r\n") + "\n", expected_lines, exclusive))
    if not cases or (dialect == "tsql" and not (TSQL_EXCLUSIVE | set(SHARED)) <= seen):
        raise ValueError(f"{path}: missing required cases")
    return cases


def invoke(command, dialect, payload):
    try:
        result = subprocess.run([*command, "--dialect", dialect], input=payload,
                                capture_output=True, timeout=150)
        return result.returncode, result.stdout, result.stderr.decode("utf-8-sig", errors="replace")
    except subprocess.TimeoutExpired:
        return None, b"", "Timed out after 150 seconds."


def layout_diff(expected, actual):
    diff = difflib.unified_diff(expected, actual, fromfile="expected", tofile="actual", lineterm="")
    return "\n".join(diff)[:5000]


def check(command, case, dialect, expectation):
    exit_code, output, stderr = invoke(command, dialect, case.sql.encode("utf-8"))
    record = {
        "source": case.dialect, "case": case.name, "line": case.line, "dialect": dialect,
        "expectation": expectation, "exit": exit_code, "checks_failed": [],
        "stdout_sha256": hashlib.sha256(output).hexdigest(),
    }
    failures = record["checks_failed"]
    if expectation == "reject":
        if stderr:
            record["diagnostic"] = stderr.strip()[:3000]
        rejected = (
            exit_code == 1 and not output and "Traceback" not in stderr
            and ("SQLFluff could not parse " in stderr or "formatting would change the SQL syntax" in stderr)
        )
        if not rejected:
            status = "accepted" if exit_code == 0 and output else "unexpected_exit"
            failures.append(status)
            if output:
                record["unexpected_output"] = output.decode("utf-8-sig")[:5000]
        return record

    if exit_code != 0 or not output.strip():
        failures.append("own_rejected" if expectation == "own" else "shared_rejected")
        record["diagnostic"] = stderr.strip()[:3000]
        return record

    if expectation == "shared":
        return record

    if case.expected_lines is not None:
        actual_lines = output.decode("utf-8-sig").replace("\r\n", "\n").removesuffix("\n").split("\n")
        if actual_lines != case.expected_lines:
            failures.append("layout")
            record["layout_diff"] = layout_diff(case.expected_lines, actual_lines)

    again_exit, again_output, again_error = invoke(command, dialect, output)
    if again_exit != 0:
        failures.append("repeat_rejected")
        record["repeat_diagnostic"] = again_error.strip()[:3000]
    elif again_output != output:
        failures.append("repeat_changed")
        record["repeat_diff"] = layout_diff(output.decode("utf-8-sig").splitlines(),
                                            again_output.decode("utf-8-sig").splitlines())
    return record


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("formatter", type=Path, help="Path to Zea.SqlFormat.exe or Zea.SqlFormat.dll")
    parser.add_argument("--report", type=Path, default=ROOT / "obj/sql-dialect-corpora/results.json")
    args = parser.parse_args()
    executable = args.formatter.resolve(strict=True)
    command = ["dotnet", str(executable)] if executable.suffix.lower() == ".dll" else [str(executable)]
    cases = [case for dialect in CORPORA for case in load_cases(dialect)]
    jobs = []
    for case in cases:
        if case.dialect != "tsql" or case.exclusive or case.expected_lines is not None:
            jobs.append((case, case.dialect, "reject" if case.name.startswith("invalid/") else "own"))
        if case.exclusive:
            jobs.extend((case, dialect, "reject") for dialect in BOUNDARY_CORPORA if dialect != case.dialect)
        if case.dialect == "tsql" and case.name in SHARED:
            jobs.extend((case, dialect, "shared") for dialect in BOUNDARY_CORPORA)

    results = []
    with ThreadPoolExecutor(max_workers=min(8, os.cpu_count() or 4)) as pool:
        checks = [pool.submit(check, command, *job) for job in jobs]
        for index, future in enumerate(checks, 1):
            results.append(future.result())
            if index % 50 == 0:
                print(f"{index}/{len(checks)} checks processed", flush=True)

    failures = Counter(issue for result in results for issue in result["checks_failed"])
    report = {
        "formatter": str(executable), "sha256": hashlib.sha256(executable.read_bytes()).hexdigest(),
        "corpus_sizes": dict(Counter(case.dialect for case in cases if case.dialect != "tsql")),
        "checks": len(results), "failed_checks": sum(bool(result["checks_failed"]) for result in results),
        "failure_kinds": dict(failures), "results": results,
    }
    args.report.parent.mkdir(parents=True, exist_ok=True)
    args.report.write_text(json.dumps(report, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
    print(json.dumps({key: value for key, value in report.items() if key != "results"}))
    print(args.report.resolve())
    return int(bool(failures))


if __name__ == "__main__":
    sys.exit(main())
