"""Build and audit the public Lean redshift release."""

from __future__ import annotations

import re
import subprocess
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
FIRST_PARTY = (ROOT / "RedshiftLWFormal", ROOT / "RedshiftLWFormal.lean")
FORBIDDEN = re.compile(r"\b(sorry|admit)\b")


def run(*command: str) -> str:
    print("+", " ".join(command), flush=True)
    completed = subprocess.run(
        command,
        cwd=ROOT,
        check=True,
        text=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
    )
    print(completed.stdout, end="")
    return completed.stdout


def lean_sources() -> list[Path]:
    files: list[Path] = []
    for path in FIRST_PARTY:
        if path.is_dir():
            files.extend(sorted(path.rglob("*.lean")))
        elif path.exists():
            files.append(path)
    return files


def reject_placeholders() -> None:
    failures: list[str] = []
    for path in lean_sources():
        for number, line in enumerate(path.read_text(encoding="utf-8").splitlines(), 1):
            code = line.split("--", 1)[0]
            if FORBIDDEN.search(code):
                failures.append(f"{path.relative_to(ROOT)}:{number}: {line.strip()}")
    if failures:
        raise SystemExit("First-party Lean placeholders found:\n" + "\n".join(failures))


def main() -> int:
    reject_placeholders()
    run("lake", "build")
    report = run("lake", "env", "lean", "RedshiftLWFormal/PublicationAudit.lean")
    if "sorryAx" in report:
        raise SystemExit("Publication theorem depends on sorryAx")
    print("REDSHIFT_RELEASE_VERIFICATION_PASS")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
