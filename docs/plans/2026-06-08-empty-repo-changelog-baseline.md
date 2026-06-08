---
title: Empty Repository Changelog Baseline
type: docs
status: completed
date: 2026-06-08
---

# Empty Repository Changelog Baseline

## Summary

Add `CHANGES.md` to the intentionally empty Android lock-screen repository and
guard it with the existing SDK-free baseline check.

## Requirements

- R1. Preserve the documented empty repository state.
- R2. Do not add Android scaffolding without app requirements.
- R3. Record maintenance changes in `CHANGES.md`.
- R4. Keep `scripts/check-baseline.sh` runnable without Android SDK tooling.

## Verification

- `scripts/check-baseline.sh`
