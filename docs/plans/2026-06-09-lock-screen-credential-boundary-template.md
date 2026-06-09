---
title: Lock Screen Credential Boundary Template
type: security
status: completed
date: 2026-06-09
---

# Lock Screen Credential Boundary Template

## Problem Frame

The lock-screen design template required permission, consent, device-admin,
threat-model, background execution, data handling, verification, and rollback
notes. It did not explicitly require future work to draw the boundary around
unlock credentials, biometric data, system authentication prompts, and
credential-like UI.

## Scope Boundaries

- Do not add Android source, Gradle scaffolding, dependencies, or app behavior.
- Preserve the repository-empty baseline and current gate targets.
- Keep this as a design-document requirement before code exists.

## Implementation Units

### U1: Add Credential Boundary Prompts

Files:

- Modify `docs/templates/lock-screen-permission-design.md`

Approach:

- Add a `Credential And Biometric Boundaries` section.
- Prompt for credentials or biometric data intentionally not collected.
- Prompt for credential-like UI, Android authentication APIs, spoofing
  boundaries, and recovery if unlock/authentication state changes.

### U2: Guard And Document The Requirement

Files:

- Modify `scripts/check-baseline.sh`
- Modify `README.md`
- Modify `VISION.md`
- Modify `SECURITY.md`
- Modify `CHANGES.md`

Approach:

- Add SDK-free checks that require the credential-boundary section and this
  plan.
- Document the credential and biometric boundary requirement in the future
  baseline and security notes.

## Verification

- `scripts/check-baseline.sh`
- `make check`
- `git diff --check`
