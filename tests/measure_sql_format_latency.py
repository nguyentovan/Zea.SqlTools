"""Compare portable Zea.SqlFormat latency with fresh and reused extraction caches."""

import argparse
import hashlib
import json
import os
from pathlib import Path
import platform
import statistics
import subprocess
import tempfile
import time


WORKLOADS = {
    "tsql": "select id,name from dbo.Users where id=1",
    "postgres": "select 1::int,2 limit 3",
}


def invoke(executable, cache, arguments, sql=""):
    env = {**os.environ, "DOTNET_BUNDLE_EXTRACT_BASE_DIR": str(cache)}
    command = [str(executable), *arguments]
    payload = sql.encode("utf-8")
    start = time.perf_counter_ns()
    result = subprocess.run(command, input=payload, capture_output=True, env=env, timeout=60)
    ms = (time.perf_counter_ns() - start) / 1_000_000
    return (result.returncode, result.stdout, result.stderr), ms


def inspect(executable):
    with tempfile.TemporaryDirectory(prefix="zea-format-check-") as cache:
        cases = [
            (["--dialects"], "", 0),
            (["--dialect", "tsql"], "select 1 \u00a7, \u00a4", 1),
            (["--dialect", "no-such-dialect"], "select 1", 2),
        ]
        outputs = []
        for arguments, sql, expected_exit in cases:
            result, _ = invoke(executable, cache, arguments, sql)
            if result[0] != expected_exit:
                raise RuntimeError(f"{executable} {arguments}: {result!r}")
            outputs.append(result)

        bridge, = Path(cache).rglob("SqlFluffBridge.py")
        package = bridge.parent / "python" / "site-packages"
        python = bridge.parent / "python" / "python.exe"
        version = subprocess.check_output([
            str(python), "-I", "-B", "-c",
            'import sys, importlib.metadata; print(sys.version.split()[0]); print(importlib.metadata.version("sqlfluff"))',
        ], text=True).splitlines()

        info = {
            "path": str(executable),
            "bytes": executable.stat().st_size,
            "sha256": hashlib.sha256(executable.read_bytes()).hexdigest(),
            "embedded_dll_sha256": hashlib.sha256(bridge.with_name("Zea.SqlFormat.dll").read_bytes()).hexdigest(),
            "bridge_sha256": hashlib.sha256(bridge.read_bytes()).hexdigest(),
            "python": version[0],
            "sqlfluff": version[1],
            "package_pyc_files": sum(1 for _ in package.rglob("*.pyc")),
        }
        plugin = package / "zea_probe-1.0.dist-info"
        plugin.mkdir()
        (plugin / "METADATA").write_text(
            "Metadata-Version: 2.1\nName: zea-probe\nVersion: 1.0\n", encoding="utf-8"
        )
        (plugin / "entry_points.txt").write_text(
            "[sqlfluff]\nzea_probe = zea_probe_missing\n", encoding="utf-8"
        )
        failure, _ = invoke(executable, cache, ["--dialect", "tsql"], "select from")
        if failure[0] != 1 or b"Failed to load SQLFluff plugin zea_probe" not in failure[2]:
            raise RuntimeError(f"{executable} lost the startup diagnostic accompanying a SQL error.")
        outputs.append(failure)

        return info, outputs


def measure(executables, dialect, sql, repeats):
    reference = None
    samples = {version: {"fresh_extraction": [], "reused_extraction": []} for version in executables}
    arguments = ["--dialect", dialect]
    for index in range(repeats):
        versions = list(executables)
        if index % 2:
            versions.reverse()
        for version in versions:
            with tempfile.TemporaryDirectory(prefix="zea-format-latency-") as cache:
                for mode in samples[version]:
                    result, ms = invoke(executables[version], cache, arguments, sql)
                    if result[0] != 0 or not result[1] or result[2]:
                        raise RuntimeError(f"{dialect} {version} {mode}: {result!r}")
                    if reference is None:
                        reference = result
                    if result != reference:
                        raise RuntimeError(f"{dialect} {version} {mode} changed formatting output.")
                    samples[version][mode].append(round(ms, 1))
    return {
        version: {mode: {"samples_ms": values, "median_ms": statistics.median(values)}
                  for mode, values in modes.items()}
        for version, modes in samples.items()
    }


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("baseline", type=Path)
    parser.add_argument("candidate", type=Path)
    parser.add_argument("--repeats", type=int, default=7)
    parser.add_argument("--report", type=Path, required=True)
    args = parser.parse_args()
    if args.repeats < 1:
        parser.error("--repeats must be positive")

    executables = {
        "baseline": args.baseline.resolve(strict=True),
        "candidate": args.candidate.resolve(strict=True),
    }
    artifacts = {}
    baseline_contract = None
    for label, executable in executables.items():
        artifacts[label], contract = inspect(executable)
        if baseline_contract is None:
            baseline_contract = contract
        elif contract != baseline_contract:
            raise RuntimeError("Dialect list or error exit code/output differs from the baseline.")

    workloads = {}
    for dialect, sql in WORKLOADS.items():
        print(f"Measuring {dialect} ({args.repeats} fresh/reused pairs per EXE)", flush=True)
        workloads[dialect] = {"sql": sql, "results": measure(executables, dialect, sql, args.repeats)}

    report = {
        "platform": platform.platform(),
        "method": (
            "Elapsed wall time per CLI invocation, including stdin/stdout. "
            "Each pair uses a new empty .NET bundle extraction directory, then immediately reuses it. "
            "The OS caches are not flushed. Baseline and candidate order alternates."
        ),
        "artifacts": artifacts,
        "workloads": workloads,
    }
    text = json.dumps(report, indent=2) + "\n"
    args.report.write_text(text, encoding="utf-8")
    print(text, end="")


if __name__ == "__main__":
    main()
