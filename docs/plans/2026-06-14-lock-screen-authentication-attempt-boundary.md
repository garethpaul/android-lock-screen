# Lock-Screen Authentication Attempt Boundary

Status: Completed

## Context

The repository correctly forbids implementation before a security design is
recorded, but the reusable template does not require an explicit policy for
repeated authentication failures. A future credential-adjacent flow could
therefore omit attempt accounting, throttling, durable lockout semantics, or a
safe recovery path while still satisfying the current empty-repository gate.

## Requirements

1. Require the design template to state whether the app handles any
   authentication secret or delegates entirely to Android platform APIs.
2. For app-observed attempts, require attempt scope, throttling or lockout,
   persistence across process death and reboot, monotonic-time handling,
   concurrency behavior, and reset conditions.
3. Require failure messaging and diagnostics that do not reveal credential,
   account, attempt, or timing details useful to an attacker.
4. Require recovery that remains user-visible and non-destructive without
   weakening emergency, system credential, or device-owner boundaries.
5. Add manual verification cases for rapid failures, process death, reboot,
   wall-clock changes, concurrent attempts, successful reset, and recovery.
6. Extend the SDK-free baseline and project guidance while keeping the
   repository implementation-free.

## Implementation Units

### U1: Strengthen The Design Template

**File:** `docs/templates/lock-screen-permission-design.md`

Add a dedicated authentication-attempt section and corresponding verification
matrix cases.

### U2: Enforce The Boundary

**File:** `scripts/check-baseline.sh`

Require every prompt and verification case, completed plan evidence, and
project guidance. Keep the existing empty-implementation and security gates.

### U3: Document The Policy

**Files:** `AGENTS.md`, `README.md`, `SECURITY.md`, `VISION.md`, `CHANGES.md`

Record that authentication-attempt handling must be designed before any
credential-adjacent implementation lands.

## Test Scenarios

- Removing each attempt-policy prompt fails the portable checker.
- Removing reboot, clock-change, concurrency, reset, or recovery verification
  fails the portable checker.
- Reopening this plan or removing project guidance fails the checker.
- `make check` continues to reject Android implementation artifacts.

## Scope Boundaries

- Do not add Android, Gradle, credential, biometric, or authentication code.
- Do not prescribe a custom PIN implementation or replace Android Keyguard.
- Do not define destructive wipe behavior as a default recovery mechanism.
- Do not merge or close any pull request without explicit authorization.

## Verification

- The focused checker and full `make check` passed from the repository and an
  external working directory. The guarded build target truthfully skipped
  because no Android project is checked in.
- Nine hostile mutations were rejected: section removal, throttling, reboot
  persistence, monotonic time, concurrency verification, recovery verification,
  security guidance, completed-plan status, and the empty-implementation gate.
- Final verification includes exact-path, whitespace, artifact,
  conflict-marker, and credential-shaped added-line audits.
