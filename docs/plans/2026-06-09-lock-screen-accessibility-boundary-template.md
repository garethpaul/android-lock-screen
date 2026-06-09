---
title: Lock Screen Accessibility Boundary Template
type: security
status: completed
date: 2026-06-09
---

# Lock Screen Accessibility Boundary Template

## Problem Frame

The lock-screen design template mentioned accessibility-service roles inside
device-admin behavior, but it did not require future implementation plans to
justify accessibility-service use, name observed events, or state safeguards
against credential capture and lock-screen bypass.

## Scope Boundaries

- Do not add Android source, Gradle scaffolding, dependencies, or app behavior.
- Preserve the repository-empty baseline and current gate targets.
- Keep this as a design-document requirement before code exists.

## Implementation Units

### U1: Add Accessibility Boundary Prompts

Files:

- Modify `docs/templates/lock-screen-permission-design.md`

Approach:

- Add an `Accessibility Service Boundary` section.
- Prompt for whether accessibility service use is required, the user benefit,
  observed event types, intentionally unused actions, and safeguards against
  credential capture or lock-screen bypass.

### U2: Guard And Document The Requirement

Files:

- Modify `scripts/check-baseline.sh`
- Modify `README.md`
- Modify `VISION.md`
- Modify `SECURITY.md`
- Modify `CHANGES.md`

Approach:

- Add SDK-free checks that require the accessibility-boundary section and this
  plan.
- Document the accessibility-service boundary requirement in the future
  baseline and security notes.

## Verification

- Red: `make lint` failed on the missing accessibility-service boundary section.
- Green: `make lint` passes after adding the section and docs.
- Full gate: `make check`.
