# Android Lock Screen CI Baseline

## Status: Completed

## Context

`android-lock-screen` is intentionally empty while it waits for a documented
implementation plan. Its root `make check` wrapper enforces the empty-repository
contract and future lock-screen design requirements without needing an Android
SDK.

## Objectives

- Run the existing empty-repository baseline in GitHub Actions.
- Keep CI aligned with the SDK-free placeholder contract.
- Make the workflow presence part of the checked repository baseline.

## Work Completed

- Added `.github/workflows/check.yml` to run `make check` on pushes, pull
  requests, and manual dispatches.
- Pinned checkout to an immutable revision, limited permissions to repository
  reads, and bounded the job to five minutes.
- Reused the existing Makefile targets, which report the Android build skip
  until an implementation exists.
- Extended `scripts/check-baseline.sh` to require the CI workflow and this
  completed plan.
- Updated README, VISION, SECURITY, and CHANGES with the CI baseline.

## Verification

- `make check`
- `scripts/check-baseline.sh`
- `git diff --check`

## Follow-Up Candidates

- Replace the empty-repository CI contract with Android SDK-backed build and
  test jobs when app scaffolding lands.
