#!/usr/bin/env sh
set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
PLAN_FILE="$ROOT_DIR/docs/plans/2026-06-08-empty-repo-baseline.md"

if [ ! -f "$ROOT_DIR/README.md" ]; then
  printf '%s\n' "README.md is required for the empty repository baseline." >&2
  exit 1
fi

if [ ! -f "$PLAN_FILE" ]; then
  printf '%s\n' "Baseline plan is missing." >&2
  exit 1
fi

if ! grep -Fq "currently an empty placeholder" "$ROOT_DIR/README.md"; then
  printf '%s\n' "README must document the current empty repository state." >&2
  exit 1
fi

if ! grep -Fq "Future Baseline" "$ROOT_DIR/README.md"; then
  printf '%s\n' "README must document future Android baseline expectations." >&2
  exit 1
fi

printf '%s\n' "Android lock screen baseline checks passed."
