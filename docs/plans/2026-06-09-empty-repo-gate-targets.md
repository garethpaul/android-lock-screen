---
title: Empty Repo Gate Targets
type: tooling
status: completed
date: 2026-06-09
---

# Empty Repo Gate Targets

## Problem Frame

The repository has no Android project yet, but the root Makefile only exposed
`make check`. That left the standard lint, test, and build gate names undefined
for automation and future contributors.

## Scope Boundaries

- Do not add Android scaffolding or Gradle commands before implementation
  exists.
- Preserve the SDK-free baseline script as the source of truth.
- Keep the build target honest by reporting a skip instead of implying an APK
  can be produced.

## Implementation Units

### U1: Add Root Gate Targets

Files:

- Modify `Makefile`

Approach:

- Add `make lint` to shell-check the baseline script and run it.
- Add `make test` to run the SDK-free baseline script.
- Add `make build` to report that no Android project is checked in yet.
- Keep `make check` as an aggregate wrapper through `make verify`.

### U2: Protect The Gate Names

Files:

- Modify `scripts/check-baseline.sh`

Approach:

- Require the root Makefile to expose `lint`, `test`, and `build`.
- Require `verify` to aggregate those gates.

### U3: Document The Workflow

Files:

- Modify `README.md`
- Modify `VISION.md`
- Modify `CHANGES.md`

Approach:

- Document the root gate names while keeping the no-Gradle-project warning
  explicit.

## Verification

- `make lint`
- `make test`
- `make build`
- `make check`
- `make verify`
- `git diff --check`
