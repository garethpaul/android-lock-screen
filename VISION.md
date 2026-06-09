## Android Lock Screen Vision

This document explains the current state and direction of the project.
Project overview and developer docs: [`README.md`](README.md)

Android Lock Screen is currently an empty public repository reserved for an
Android custom lock screen experiment.

The only authoritative project context today is the repository description:
"Android custom lock screen." The repository now has baseline README, changelog,
security, verification, and permission-design docs, but no Android
implementation or Gradle project is checked in.

The goal is to keep the repository ready for a focused, well-documented sample
rather than accumulate unclear scaffolding.

The current focus is:

Priority:

- Establish basic project direction before adding code
- Keep any future lock-screen behavior explicit about Android version support
- Avoid committing secrets, signing material, or generated build output
- Document setup and verification as soon as implementation exists
- Keep root lint, test, and guarded build gates available while the repository
  remains implementation-free
- Require a permission, consent, and device-admin design note before code lands
- Keep a reusable security design template available before implementation
  scaffolding is added

Next priorities:

- Keep README and verification notes current when implementation starts
- Choose a modern Android baseline and document required permissions
- Define whether this is a learning sample, a reusable component, or a full app
- Add tests or manual verification steps for any lock-screen interaction

Contribution rules:

- One PR = one focused setup or implementation topic.
- Do not add large generated project scaffolding without explaining the target
  Android baseline.
- Keep repository-root docs updated as soon as code is introduced.
- Prefer a small working sample over broad unverified lock-screen behavior.

## Security And Privacy

Canonical security policy and reporting:

- [`SECURITY.md`](SECURITY.md)

Lock-screen code interacts with a sensitive device surface. Future
implementation must avoid bypassing user consent, weakening device security, or
collecting personal data without clear purpose and controls.

## What We Will Not Merge (For Now)

- Code that attempts to defeat platform lock-screen protections
- Credential, signing, or local SDK files
- Broad app scaffolding without README and verification notes
- Background data collection unrelated to the lock-screen sample

This list is a roadmap guardrail, not a permanent rule.
Strong user demand and strong technical rationale can change it.
