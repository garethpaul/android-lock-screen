#!/usr/bin/env sh
set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
TEST_TMP=$(mktemp -d "${TMPDIR:-/tmp}/android-lock-screen-check.XXXXXX")
trap 'rm -rf "$TEST_TMP"' EXIT HUP INT TERM

copy_fixture() {
  fixture=$1
  mkdir -p "$fixture"
  tar -C "$ROOT_DIR" \
    --exclude=.git \
    --exclude=.DS_Store \
    -cf - . | tar -C "$fixture" -xf -
}

expect_pass() {
  name=$1
  fixture="$TEST_TMP/$name"
  copy_fixture "$fixture"
  if ! "$fixture/scripts/check-baseline.sh" >"$fixture/output" 2>&1; then
    printf '%s\n' "Expected baseline to pass: $name" >&2
    cat "$fixture/output" >&2
    exit 1
  fi
}

expect_reject() {
  name=$1
  mutation=$2
  expected=$3
  fixture="$TEST_TMP/$name"
  copy_fixture "$fixture"
  (CDPATH= cd -- "$fixture" && sh -c "$mutation")
  if "$fixture/scripts/check-baseline.sh" >"$fixture/output" 2>&1; then
    printf '%s\n' "Expected hostile mutation to be rejected: $name" >&2
    exit 1
  fi
  if ! grep -Fq "$expected" "$fixture/output"; then
    printf '%s\n' "Hostile mutation failed for the wrong reason: $name" >&2
    cat "$fixture/output" >&2
    exit 1
  fi
}

expect_pass baseline

expect_reject kotlin_gradle_build \
  'printf "%s\n" "plugins { id(\"com.android.application\") }" > build.gradle.kts' \
  'Android implementation artifacts'
expect_reject nested_manifest \
  'mkdir -p feature/src/main && printf "%s\n" "<manifest package=\"example\" />" > feature/src/main/AndroidManifest.xml' \
  'Android implementation artifacts'
expect_reject kotlin_source \
  'mkdir -p feature/src/main/java/example && printf "%s\n" "class LockActivity" > feature/src/main/java/example/LockActivity.kt' \
  'Android implementation artifacts'
expect_reject gradle_wrapper \
  'mkdir -p gradle/wrapper && printf "%s\n" "distributionUrl=https://example.invalid/gradle.zip" > gradle/wrapper/gradle-wrapper.properties' \
  'Android implementation artifacts'
expect_reject workflow_write_permission \
  'sed -i.bak "/contents: read/a\\
  pull-requests: write
" .github/workflows/check.yml && rm .github/workflows/check.yml.bak' \
  'permissions must contain only contents: read'
expect_reject workflow_job_write_permission \
  'sed -i.bak "/runs-on: ubuntu-24.04/a\\
    permissions:\\
      pull-requests: write
" .github/workflows/check.yml && rm .github/workflows/check.yml.bak' \
  'permissions must contain only contents: read'
expect_reject workflow_checkout_token \
  'sed -i.bak "/persist-credentials: false/a\\
          token: \${{ secrets.REPOSITORY_TOKEN }}
" .github/workflows/check.yml && rm .github/workflows/check.yml.bak' \
  'must not receive an explicit token'

printf '%s\n' "Android lock screen hostile baseline tests passed."
