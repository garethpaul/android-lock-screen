---
title: Empty Repository Check Wrapper
status: completed
date: 2026-06-08
origin: user-requested continuous engineering quality loop
execution: code
---

# Empty Repository Check Wrapper

## Problem Frame

The repository is intentionally empty, but future Android work still needs a
standard local verification entry point and ignore rules before generated build
artifacts or local SDK configuration appear.

The generated README also drifted into documenting Gradle commands even though
no Gradle project exists yet.

## Scope Boundaries

- Do not add Android Gradle scaffolding without implementation requirements.
- Do not define lock-screen app behavior in this maintenance pass.
- Keep verification SDK-free while the repository has no Android project.

## Implementation Units

### U1: Local Check Wrapper

Files:

- `Makefile`
- `scripts/check-baseline.sh`

Approach:

- Add `make check` as the root verification command.
- Keep `scripts/check-baseline.sh` as the underlying SDK-free check.
- Require the wrapper in the baseline script.

### U2: Generated Artifact Ignores

Files:

- `.gitignore`
- `README.md`
- `CHANGES.md`

Approach:

- Ignore local Android SDK configuration, Android Studio state, Gradle caches,
  build directories, and generated Android package artifacts.
- Restore README language that accurately states no Gradle project exists yet.

## Verification

- `make check`
- `scripts/check-baseline.sh`
- `git diff --check`
