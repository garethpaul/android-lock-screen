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

## Multi-User And Profile Boundaries

- Supported Android user and profile types, including primary, secondary,
  guest, managed work, clone, and private profiles:
- Device-owner, profile-owner, administrator, and ordinary-app authority for
  each supported user or profile type:
- Per-user and per-profile scoping for lock state, policy, attempts,
  credentials, notifications, diagnostics, and persisted data:
- Behavior during user or profile start, stop, switch, unlock, quiet mode,
  logout, and foreground/background transitions:
- Cross-user APIs, components, permissions, or shared storage intentionally
  not used, or exact system-only justification and caller validation:
- Handling of in-flight authentication, background work, and restored state
  when the active user or profile changes:
- Cleanup after secondary-user removal, guest deletion, logout, work-profile
  removal, or ownership transfer:
- Fail-safe behavior when user or profile identity is unavailable, stale, or
  changes during a sensitive operation:

## Authentication Attempt Handling

- Platform-delegated authentication versus app-observed secret or attempt data:
- Attempt accounting scope across user, account, device, process, and credential type:
- Progressive delay, throttling, or lockout policy and maximum attempt rate:
- Persistence across process death, reboot, app update, and device-owner transitions:
- Monotonic-time source and behavior after wall-clock or timezone changes:
- Serialization of concurrent UI, component, automation, and restored-state attempts:
- Successful-authentication, administrator, enrollment, and recovery reset conditions:
- Failure messaging and production diagnostics without credential, account, attempt, or timing disclosure:
- User-visible non-destructive recovery that preserves emergency and system authentication access:

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

- Inventory of every service, receiver, alarm, job, and worker with trigger,
  exported state, permission boundary, lifetime, and cancellation path:
- Direct-boot behavior and separation of device-protected from
  credential-protected storage until user unlock:
- Foreground-service type, user-visible notification, user stop path, and
  behavior when foreground execution cannot start:
- Restart policy after process death, task removal, force-stop, reboot, package
  update, permission revocation, ownership loss, and feature disable:
- Doze, app standby, battery, scheduling, duplicate-work, retry, and backoff
  boundaries:
- Fail-safe behavior when background work is delayed, denied, duplicated, or
  restored from stale state:

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
- Rapid repeated authentication failures and maximum attempt rate:
- Authentication attempt state after process death and reboot:
- Authentication attempt state after wall-clock and timezone changes:
- Concurrent attempts from UI, exported components, automation, and restored state:
- Successful authentication and authorized reset of attempt state:
- Non-destructive recovery while emergency and system authentication remain available:
- Secondary-user and guest creation, switch, logout, deletion, and re-creation:
- Work-profile enable, disable, quiet mode, unlock, and removal:
- In-flight authentication or background work across a user or profile switch:
- Per-user storage and policy isolation plus rejection of unauthorized cross-user calls:
- Locked boot before user unlock and credential-protected data availability:
- Foreground-service disclosure, user stop, and denied-start behavior:
- Process death, task removal, force-stop, reboot, and package update:
- Feature disable, permission revocation, and ownership loss without hidden restart:
- Doze, standby, duplicate scheduling, retry, and delayed-work behavior:
- Lock-screen entry and exit:
- Reboot:
- Uninstall or disable:

## Disable And Uninstall Path

- User steps to disable the feature:
- Cleanup performed on disable:
- Cleanup performed on uninstall:
- Recovery behavior if activation fails:
