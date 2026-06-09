# Lock Screen Empty Implementation Gate

Date: 2026-06-09
Status: Completed

## Problem

The repository intentionally documents that no Android implementation or Gradle
project exists yet, but the baseline check did not fail if Gradle files or
Android source directories appeared while that empty-repository contract stayed
unchanged. That could let accidental scaffolding drift in before the required
permission, consent, and security design work replaces the placeholder baseline.

## Scope

- Preserve the current implementation-free repository state.
- Do not add Android source, Gradle scaffolding, dependencies, or app behavior.
- Require future implementation work to replace this empty baseline
  deliberately.
- Keep verification SDK-free.

## Work Completed

- Added baseline checks that reject common Android implementation artifacts
  (`build.gradle`, `settings.gradle`, Gradle wrappers, `app`, `Application`, and
  `src`) while the empty-repository contract is active.
- Documented that future app scaffolding must replace the empty baseline first.
- Recorded the guard in README, VISION, and CHANGES.

## Verification

- `scripts/check-baseline.sh`
- `make check`
- `git diff --check`
