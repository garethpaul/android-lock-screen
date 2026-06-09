# Lock Screen Permission Design

Use this template before adding lock-screen implementation code. Keep the note
in `docs/plans/` with the implementation plan it supports.

## Supported Android Versions

- Minimum SDK:
- Target SDK:
- Tested Android versions and devices:
- Platform lock-screen APIs or alternatives:

## Permission And Consent Flow

- Permissions requested:
- User-visible rationale:
- First-run consent flow:
- Settings or in-app controls for changing consent:

## Device Admin Or Device Owner Behavior

- Device-admin, device-owner, or accessibility-service role:
- Enrollment or activation path:
- User-visible disable path:
- Restrictions intentionally not used:

## Threat Model

- Assets protected by the lock-screen behavior:
- Trust boundaries crossed:
- Misuse or bypass scenarios:
- Mitigations built into the design:
- Residual risks accepted:

## Background Execution

- Services, receivers, alarms, jobs, or foreground notifications:
- Behavior while the device is locked:
- Battery and lifecycle constraints:
- Expected behavior after reboot:

## Data Handling

- Data read from the device:
- Data stored locally:
- Data transmitted off-device:
- Logs, analytics, and crash-reporting boundaries:

## Manual Verification Matrix

- Fresh install:
- Permission denial:
- Permission revocation:
- Lock-screen entry and exit:
- Reboot:
- Uninstall or disable:

## Disable And Uninstall Path

- User steps to disable the feature:
- Cleanup performed on disable:
- Cleanup performed on uninstall:
- Recovery behavior if activation fails:
