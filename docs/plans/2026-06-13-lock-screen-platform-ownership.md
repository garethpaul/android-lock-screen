# Define Lock-Screen Platform Ownership

Status: Completed

## Context

The design template discusses device-owner behavior but does not require a
future implementation to choose among a normal activity, launcher, screen
pinning, or managed-device lock-task mode. Without that decision, a sample can
overstate what `showWhenLocked`-style presentation can do or accidentally imply
that secure system keyguard may be bypassed.

## Requirements

- R1. Add a platform ownership and capability section to the reusable design
  template before Android scaffolding is allowed.
- R2. Require the design to choose normal activity, launcher, screen pinning,
  or device-owner/DPC-managed lock-task mode and state why.
- R3. Require explicit limits for presentation over keyguard, forbid bypass in
  normal app modes, and scope any keyguard exception to a fully managed device.
- R4. Require device-owner enrollment, package allowlisting, and lock-task
  feature decisions when managed-device APIs are selected.
- R5. Require user-visible exit, deprovisioning, fallback, and recovery paths.
- R6. Require manual verification on both supported and unsupported ownership
  states, including rejection of lock-screen replacement or bypass claims.
- R7. Preserve the empty implementation gate and every existing permission,
  credential, accessibility, overlay, task, emergency, and data-lifecycle
  prerequisite.

## Verification

- Canonical, external-directory, and isolated `make check`.
- `sh -n scripts/check-baseline.sh` and `git diff --check`.
- Hostile mutations for each ownership prompt, verification prompt, temporary
  Android implementation artifact, stale plan status, and missing evidence.
- Exact-base artifact and credential-shaped added-line inspection.
- Exact-head hosted check and branch code-scanning snapshot after push.

## Sources

- Android lock task mode guidance:
  https://developer.android.com/work/dpc/dedicated-devices/lock-task-mode
- Android dedicated-device ownership guidance:
  https://developer.android.com/work/dpc/dedicated-devices
- Android `KeyguardManager` API reference:
  https://developer.android.com/reference/android/app/KeyguardManager

## Work Completed

- Added platform ownership and capability decisions to the reusable lock-screen
  design template.
- Required explicit mode selection, secure Keyguard boundaries and managed-device
  exceptions, enrollment/allowlisting, unsupported-state behavior, and
  exit/recovery paths.
- Added unmanaged, managed/allowlisted, and unsupported ownership cases to the
  manual verification matrix.
- Updated repository guidance while preserving the implementation-free gate.

## Verification Completed

- Canonical, external-directory, and isolated `make check` passed the SDK-free
  lint/test gates and intentional no-project build skip.
- `sh -n scripts/check-baseline.sh` and `git diff --check` passed.
- Fourteen hostile mutations were rejected: each of eight ownership prompts,
  each of three ownership verification cases, a temporary Android build
  artifact, stale plan status, and missing verification evidence.
- Exact-base generated-artifact and credential-shaped added-line scans passed.
- Hosted check and code-scanning evidence is recorded separately after push;
  this plan claims only the completed local implementation-free verification.
