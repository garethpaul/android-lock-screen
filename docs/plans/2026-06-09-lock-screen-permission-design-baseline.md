---
title: Lock Screen Permission Design Baseline
type: security
status: completed
date: 2026-06-09
---

# Lock Screen Permission Design Baseline

## Problem Frame

The repository is intentionally empty, but its planned topic touches a sensitive
Android surface. Future implementation work should not add lock-screen code,
permissions, device-admin/device-owner behavior, or background services before
documenting the security model and verification approach.

## Scope Boundaries

- Do not add Android source, Gradle scaffolding, dependencies, or app behavior
  in this pass.
- Keep the current repository-empty baseline intact.
- Add only documentation and SDK-free checks for future implementation
  requirements.

## Implementation Units

### U1: Document Future Security Requirements

Files:

- Modify `README.md`
- Modify `VISION.md`
- Modify `CHANGES.md`

Approach:

- Require a permission and consent design note before lock-screen
  implementation.
- Call out Android version support, device-admin/device-owner behavior,
  background execution, and sensitive data handling as required design topics.

### U2: Guard The Empty Baseline

Files:

- Modify `scripts/check-baseline.sh`

Approach:

- Assert that README documents the future permission/security design note.
- Assert that this plan remains present while the repository is empty.

## Verification

- `make check`
- `scripts/check-baseline.sh`
- `git diff --check`
