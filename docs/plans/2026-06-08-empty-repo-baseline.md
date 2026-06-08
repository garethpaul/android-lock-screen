---
title: Android Lock Screen Empty Repository Baseline
type: docs
status: completed
date: 2026-06-08
---

# Android Lock Screen Empty Repository Baseline

## Summary

Establish a minimal baseline for the empty Android lock-screen repository so future implementation work has a documented starting point, a clear scope boundary, and a lightweight check.

---

## Problem Frame

The repository currently has a project vision document but no committed source, build files, README, or tests. There is no implementation to modernize safely yet, so the highest-leverage first step is to make the empty state explicit and define the quality bar expected before app code is added.

---

## Requirements

- R1. The repository must include a README that states the repo is intentionally empty today.
- R2. The README must describe the expected future Android project baseline before app code is added.
- R3. The repository must include a local check that verifies the baseline documentation exists.
- R4. The plan must avoid inventing app behavior, build files, or dependencies without implementation requirements.

---

## Key Technical Decisions

- **Document before scaffolding:** Do not add an Android Gradle project until there is a concrete app implementation or target SDK requirement.
- **Use an SDK-free check:** A shell script can verify the repository baseline without requiring Android tooling.
- **Keep future quality expectations visible:** README should name the expected future baseline: Gradle wrapper, Android SDK target, tests, and CI.

---

## Scope Boundaries

- This pass does not add Android app source code.
- This pass does not add Gradle, Android SDK, CI, or dependency manifests.
- This pass does not define lock-screen product behavior.

---

## Implementation Units

### U1. Baseline Documentation

- **Goal:** Make the empty repository state explicit and useful.
- **Files:** `README.md`
- **Patterns:** Short sections for current status, future baseline, and verification.
- **Test Scenarios:**
  - README states that no Android implementation is committed yet.
  - README lists future expectations for a real Android project baseline.
- **Verification:** `scripts/check-baseline.sh`

### U2. SDK-Free Baseline Check

- **Goal:** Provide a local check for the documentation baseline.
- **Files:** `scripts/check-baseline.sh`
- **Patterns:** POSIX shell with repo-root detection and fail-fast messages.
- **Test Scenarios:**
  - The script fails if `README.md` is missing.
  - The script fails if the plan file is missing.
  - The script fails if README no longer documents the empty state.
- **Verification:** `scripts/check-baseline.sh`

---

## Risks & Dependencies

- Future app work still needs real requirements before scaffolding.
- Once app code is added, this baseline should be superseded by a buildable Android project plan with tests and CI.

---

## Sources / Research

- `VISION.md` is the only tracked project artifact before this baseline.
- `rg --files` returns no Android source, Gradle, or test files before this baseline.
