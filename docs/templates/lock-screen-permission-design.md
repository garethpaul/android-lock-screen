# Lock Screen Permission Design

Use this template before adding lock-screen implementation code. Keep the note
in `docs/plans/` with the implementation plan it supports.

## Supported Android Versions

- Minimum SDK:
- Target SDK:
- Tested Android versions and devices:
- Platform lock-screen APIs or alternatives:

## Platform Ownership And Capability

- Selected mode: normal Activity, launcher, screen pinning, or DPC-managed lock task:
- Platform APIs used and capability limits for the selected mode:
- Secure Keyguard credential and biometric boundary, including any fully managed-device exception:
- Device-owner or DPC enrollment and deprovisioning path, if required:
- Lock-task package allowlisting and system UI feature decisions, if required:
- Behavior when lock task is not permitted or ownership prerequisites are absent:
- User-visible exit, fallback, and recovery path for each supported mode:
- Lock-screen replacement, authentication-bypass, or device-ownership claims explicitly not made:

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

## Sensitive Data Lifecycle

- Data classification for lock state, account, device, credential-adjacent,
  biometric-adjacent, and diagnostic data:
- Data read from the device:
- Internal versus external storage locations with justification:
- Encryption at rest and key-management boundary:
- Cloud backup inclusion or exclusion by persisted data category:
- Device-to-device transfer inclusion or exclusion by persisted data category:
- Data transmitted off-device:
- Retention period and deletion triggers:
- Cleanup on disable, sign-out, uninstall, and account removal:
- Restore validation before recovered state can affect lock-screen behavior:
- Production log, analytics, and crash-report redaction rules:

## Manual Verification Matrix

- Fresh install:
- Normal unmanaged-device mode:
- Managed and lock-task-allowlisted device mode, if supported:
- Unsupported or unpermitted ownership state:
- Permission denial:
- Permission revocation:
- Cloud backup, device-transfer, and restore behavior:
- Lock-screen entry and exit:
- Reboot:
- Uninstall or disable:

## Disable And Uninstall Path

- User steps to disable the feature:
- Cleanup performed on disable:
- Cleanup performed on uninstall:
- Recovery behavior if activation fails:
