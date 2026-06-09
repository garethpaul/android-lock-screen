---
title: Lock Screen Design Template
type: security
status: completed
date: 2026-06-09
---

# Lock Screen Design Template

## Problem Frame

The repository is empty by design, but future lock-screen work needs more than
a generic warning. Contributors need a concrete template that forces the
permission, consent, device-admin, background execution, data handling, and
manual verification questions to be answered before code appears.

## Scope Boundaries

- Do not add Android source, Gradle scaffolding, dependencies, or runtime
  behavior in this pass.
- Keep the current empty-repository baseline intact.
- Add only a reusable design template, documentation, and SDK-free checks.

## Implementation Units

### U1: Add The Design Template

Files:

- Create `docs/templates/lock-screen-permission-design.md`

Approach:

- Include sections for supported Android versions, permissions and consent,
  device-admin or device-owner behavior, background execution, data handling,
  manual verification, and disable/uninstall behavior.
- Keep the template short enough to be used before a first implementation PR.

### U2: Guard Template Availability

Files:

- Modify `scripts/check-baseline.sh`

Approach:

- Require the template file while the repository remains empty.
- Assert the core security and verification sections stay present.
- Require README to link the template from the future-baseline guidance.

### U3: Document The Guardrail

Files:

- Modify `README.md`
- Modify `VISION.md`
- Modify `CHANGES.md`

Approach:

- Make the template the expected starting point for future lock-screen code.
- Preserve the rule that Android implementation work needs a design note before
  code lands.

## Verification

- `make check`
- `scripts/check-baseline.sh`
- `git diff --check`
