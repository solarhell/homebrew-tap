#!/usr/bin/env python3
"""Check that cask_renames.json stays consistent with the casks in this tap.

A rename entry maps an old token to a current one. Two things must hold:

  * the target token must exist, otherwise the rename points nowhere and
    existing installations lose their upgrade path;
  * the source token must NOT exist as a real cask, otherwise the tap ships a
    cask and a rename under the same name, and Homebrew resolves the real cask
    while `cask_renames.json` silently stops applying.

The second case is the one that bites: it looks fine locally and only shows up
once a user with an old installation tries to upgrade.
"""

import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
RENAMES = ROOT / "cask_renames.json"
CASKS = ROOT / "Casks"


def main() -> int:
    if not RENAMES.exists():
        print("cask_renames.json not found, nothing to check")
        return 0

    try:
        renames = json.loads(RENAMES.read_text())
    except json.JSONDecodeError as exc:
        print(f"error: cask_renames.json is not valid JSON: {exc}")
        return 1

    if not isinstance(renames, dict):
        print("error: cask_renames.json must be a JSON object")
        return 1

    tokens = {path.stem for path in CASKS.glob("*.rb")}
    errors = []

    for old, new in sorted(renames.items()):
        if not isinstance(new, str):
            errors.append(f"{old!r}: target must be a string, got {new!r}")
            continue
        if new not in tokens:
            errors.append(f"{old!r} -> {new!r}: target cask Casks/{new}.rb does not exist")
        if old in tokens:
            errors.append(
                f"{old!r} -> {new!r}: Casks/{old}.rb also exists, so the rename "
                f"never applies and the old token shadows it"
            )

    for error in errors:
        print(f"error: {error}")

    if errors:
        return 1

    print(f"cask_renames.json ok ({len(renames)} rename(s), {len(tokens)} cask(s))")
    return 0


if __name__ == "__main__":
    sys.exit(main())
