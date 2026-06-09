#!/usr/bin/env sh
set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
PLAN_FILE="$ROOT_DIR/docs/plans/2026-06-08-empty-repo-baseline.md"
SECURITY_PLAN_FILE="$ROOT_DIR/docs/plans/2026-06-09-lock-screen-permission-design-baseline.md"
DESIGN_TEMPLATE_FILE="$ROOT_DIR/docs/templates/lock-screen-permission-design.md"

if [ ! -f "$ROOT_DIR/README.md" ]; then
  printf '%s\n' "README.md is required for the empty repository baseline." >&2
  exit 1
fi

if [ ! -f "$PLAN_FILE" ]; then
  printf '%s\n' "Baseline plan is missing." >&2
  exit 1
fi

if [ ! -f "$SECURITY_PLAN_FILE" ]; then
  printf '%s\n' "Future lock-screen permission design plan is missing." >&2
  exit 1
fi

if [ ! -f "$DESIGN_TEMPLATE_FILE" ]; then
  printf '%s\n' "Future lock-screen permission design template is missing." >&2
  exit 1
fi

if [ ! -f "$ROOT_DIR/CHANGES.md" ]; then
  printf '%s\n' "CHANGES.md is required for repository maintenance history." >&2
  exit 1
fi

if [ ! -f "$ROOT_DIR/Makefile" ]; then
  printf '%s\n' "Makefile is required for the repository check wrapper." >&2
  exit 1
fi

if [ ! -f "$ROOT_DIR/.gitignore" ]; then
  printf '%s\n' ".gitignore is required before Android scaffolding is added." >&2
  exit 1
fi

if ! grep -Fq "currently an empty placeholder" "$ROOT_DIR/README.md"; then
  printf '%s\n' "README must document the current empty repository state." >&2
  exit 1
fi

if grep -Fq "There is no checked-in implementation or README yet." "$ROOT_DIR/VISION.md"; then
  printf '%s\n' "VISION must not claim README.md is missing after baseline docs exist." >&2
  exit 1
fi

if ! grep -Fq "baseline README, changelog" "$ROOT_DIR/VISION.md"; then
  printf '%s\n' "VISION must describe the current documentation baseline." >&2
  exit 1
fi

if ! grep -Fq "implementation or Gradle project is checked in" "$ROOT_DIR/VISION.md"; then
  printf '%s\n' "VISION must still document the lack of Android implementation." >&2
  exit 1
fi

if ! grep -Fq "Future Baseline" "$ROOT_DIR/README.md"; then
  printf '%s\n' "README must document future Android baseline expectations." >&2
  exit 1
fi

if ! grep -Fq "CHANGES.md" "$ROOT_DIR/README.md"; then
  printf '%s\n' "README must document the repository change log." >&2
  exit 1
fi

if ! grep -Fq "scripts/check-baseline.sh" "$ROOT_DIR/README.md"; then
  printf '%s\n' "README must document the SDK-free baseline command." >&2
  exit 1
fi

if ! grep -Fq "make check" "$ROOT_DIR/README.md"; then
  printf '%s\n' "README must document the make check wrapper." >&2
  exit 1
fi

if ! grep -Fq "No Gradle project is checked in yet" "$ROOT_DIR/README.md"; then
  printf '%s\n' "README must not imply an Android build exists yet." >&2
  exit 1
fi

if ! grep -Fq "permission and consent design note" "$ROOT_DIR/README.md"; then
  printf '%s\n' "README must require a future permission and consent design note." >&2
  exit 1
fi

if ! grep -Fq "docs/templates/lock-screen-permission-design.md" "$ROOT_DIR/README.md"; then
  printf '%s\n' "README must link the future permission design template." >&2
  exit 1
fi

if ! grep -Fq "device-admin or device-owner behavior" "$ROOT_DIR/README.md"; then
  printf '%s\n' "README must call out future device-admin/device-owner behavior." >&2
  exit 1
fi

if ! grep -Fq "background execution" "$ROOT_DIR/README.md"; then
  printf '%s\n' "README must call out future background execution behavior." >&2
  exit 1
fi

if ! grep -Fq "scripts/check-baseline.sh" "$ROOT_DIR/Makefile"; then
  printf '%s\n' "Makefile must run the baseline script." >&2
  exit 1
fi

if ! grep -Fq "local.properties" "$ROOT_DIR/.gitignore"; then
  printf '%s\n' ".gitignore must exclude local Android SDK configuration." >&2
  exit 1
fi

for pattern in \
  "## Supported Android Versions" \
  "## Permission And Consent Flow" \
  "## Device Admin Or Device Owner Behavior" \
  "## Background Execution" \
  "## Data Handling" \
  "## Manual Verification Matrix" \
  "## Disable And Uninstall Path"; do
  if ! grep -Fq "$pattern" "$DESIGN_TEMPLATE_FILE"; then
    printf '%s\n' "Lock-screen design template is missing section: $pattern" >&2
    exit 1
  fi
done

if grep -Fq "gradle assembleDebug" "$ROOT_DIR/README.md"; then
  printf '%s\n' "README must not document Gradle assembly before a project exists." >&2
  exit 1
fi

if grep -Fq "gradle test" "$ROOT_DIR/README.md"; then
  printf '%s\n' "README must not document Gradle tests before a project exists." >&2
  exit 1
fi

printf '%s\n' "Android lock screen baseline checks passed."
