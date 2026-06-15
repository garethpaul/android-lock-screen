# Lock-Screen Background Execution Boundary

Status: Planned

## Context

The reusable lock-screen design template names services, receivers, alarms,
jobs, notifications, locked-device behavior, battery constraints, and reboot,
but it does not require concrete ownership and lifecycle decisions. A future
implementation could therefore satisfy the template while silently restarting
after disable, reading credential-protected data during direct boot, running an
undisclosed foreground service, or relying on background execution that modern
Android will defer or reject.

## Requirements

1. Require every service, receiver, alarm, job, and worker to document its
   trigger, exported state, permission boundary, lifetime, and cancellation.
2. Require direct-boot behavior to separate device-protected from
   credential-protected storage and defer unavailable user data until unlock.
3. Require foreground-service type, notification visibility, user stop path,
   and behavior when foreground execution cannot start.
4. Require restart policy after process death, task removal, force-stop, reboot,
   package update, permission revocation, ownership loss, and feature disable.
5. Require Doze, standby, battery, scheduling, duplicate-work, and retry
   boundaries that fail safe without weakening emergency or platform auth UI.
6. Add manual verification for locked boot, unlock transition, foreground
   disclosure, process death, force-stop, reboot, disable, and denied startup.
7. Extend the SDK-free checker and project guidance while keeping the repository
   implementation-free.

## Implementation Units

### U1: Strengthen The Design Template

**File:** `docs/templates/lock-screen-permission-design.md`

Replace the shallow background section with explicit component inventory,
direct-boot storage, foreground-service, restart, scheduling, cancellation,
and fail-safe prompts. Extend the verification matrix with lifecycle cases.

### U2: Enforce The Boundary

**File:** `scripts/check-baseline.sh`

Require one background-execution section, every design prompt and verification
case, completed-plan evidence, and project guidance. Preserve all existing
empty-repository and security gates.

### U3: Document The Policy

**Files:** `AGENTS.md`, `README.md`, `SECURITY.md`, `VISION.md`, `CHANGES.md`

Record that background-execution and direct-boot lifecycle boundaries must be
designed before future components land.

## Test Scenarios

- Removing component inventory, direct-boot storage, foreground-service,
  restart, cancellation, scheduling, or fail-safe prompts fails verification.
- Removing locked-boot, force-stop, denied-start, or disable verification fails.
- Reopening this plan or removing repository guidance fails verification.
- `make check` continues to reject Android and Gradle implementation artifacts.

## Scope Boundaries

- Do not add Android, Gradle, service, receiver, worker, alarm, or notification
  implementation.
- Do not prescribe always-on execution or imply that normal apps can replace
  secure Keyguard behavior.
- Do not weaken emergency, system authentication, ownership, or user-disable
  invariants.
- Keep this work stacked on the authentication-attempt boundary pull request.

## Verification To Complete

- Run the focused checker and repository/external-directory `make check`.
- Reject isolated hostile mutations for every new lifecycle category,
  verification evidence, guidance, plan status, and empty-implementation gate.
- Run exact diff, artifact, conflict-marker, likely-secret, and whitespace
  audits.
- Take one bounded exact-head hosted snapshot after push without polling.

