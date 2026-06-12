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

## Accessibility Service Boundary

- Accessibility service required:
- User benefit that cannot be met with less-sensitive APIs:
- Event types observed:
- Actions intentionally not performed:
- Safeguards against credential capture or lock-screen bypass:

## Threat Model

- Assets protected by the lock-screen behavior:
- Trust boundaries crossed:
- Misuse or bypass scenarios:
- Mitigations built into the design:
- Residual risks accepted:

## Credential And Biometric Boundaries

- Credentials or biometric data intentionally not collected:
- Any credential-like prompts shown by the app:
- Android Keyguard, BiometricPrompt, or credential APIs used:
- Boundaries that prevent spoofing system authentication:
- User-visible recovery if unlock or authentication state changes:

## Overlay And Input Integrity

- Overlay or draw-over-other-apps permissions requested:
- Why standard Activity, Keyguard, or device-owner APIs are insufficient:
- Obscured and partially obscured touch rejection:
- Screenshot, screen recording, and screen-sharing boundaries:
- Accessibility overlay and trusted system UI behavior:
- Manual tapjacking and overlay-abuse verification:

## Activity Task And Component Boundaries

- Exported activities, services, receivers, and providers with justification:
- External intent, deep-link, and PendingIntent validation:
- Back, Home, Overview, and task-switching behavior:
- Recents snapshot and task-preview privacy:
- State restoration after configuration change or process recreation:
- Manual verification for unauthorized component launches and task re-entry:

## Background Execution

- Services, receivers, alarms, jobs, or foreground notifications:
- Behavior while the device is locked:
- Battery and lifecycle constraints:
- Expected behavior after reboot:

## Emergency And System UI Invariants

- Emergency calling and emergency information access:
- Incoming calls, alarms, and critical system alerts:
- System credential and biometric UI that must remain unobscured:
- Behavior after process death, crash loops, reboot, and direct boot:
- Fail-safe behavior when lock-screen state cannot be determined:
- Recovery through safe mode or platform settings:

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
