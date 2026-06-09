---
title: Lock Screen Threat Model Template
type: security
status: completed
date: 2026-06-09
---

# Lock Screen Threat Model Template

## Problem Frame

The lock-screen design template covered permissions, consent, device-admin
behavior, background execution, data handling, verification, and rollback. It
did not explicitly require future implementation plans to name protected assets,
trust boundaries, bypass scenarios, mitigations, and accepted residual risk.

## Scope Boundaries

- Do not add Android source, Gradle scaffolding, dependencies, or app behavior.
- Preserve the repository-empty baseline and current gate targets.
- Keep this as a design-document requirement before code exists.

## Implementation Units

### U1: Add Threat-Model Prompts

Files:

- Modify `docs/templates/lock-screen-permission-design.md`

Approach:

- Add a `Threat Model` section.
- Prompt for protected assets, trust boundaries, misuse or bypass scenarios,
  mitigations, and residual risk.

### U2: Guard And Document The Requirement

Files:

- Modify `scripts/check-baseline.sh`
- Modify `README.md`
- Modify `VISION.md`
- Modify `CHANGES.md`

Approach:

- Add SDK-free checks that require the threat-model section and plan.
- Document the threat-model requirement in the future baseline and security
  notes.

## Verification

- `scripts/check-baseline.sh`
- `make lint`
- `make test`
- `make build`
- `make check`
- `make verify`
- `git diff --check`
