# Lock Screen Sensitive Data Lifecycle Boundary

Status: Completed

## Priority

The repository correctly blocks implementation until a permission and security
design exists, but the current `Data Handling` template records only broad data
categories. It does not require decisions about internal versus external
storage, Android Auto Backup and device transfer, retention and deletion,
encryption, or log and crash-report redaction. Those omissions are material for
authentication-adjacent and lock-state data.

## Requirements

- **R1:** Require explicit classification of lock-state, account, device,
  credential-adjacent, biometric-adjacent, and diagnostic data.
- **R2:** Require internal/external storage and encryption-at-rest decisions.
- **R3:** Require Android cloud-backup and device-to-device transfer inclusion
  or exclusion decisions for every persisted category.
- **R4:** Require retention, disable, sign-out, uninstall, and restore cleanup
  behavior.
- **R5:** Require production log, analytics, and crash-report redaction rules.
- **R6:** Require manual cloud-backup, device-transfer, and restore verification.
- **R7:** Preserve the empty-repository gate and every existing permission,
  consent, credential, accessibility, overlay, task, emergency, and recovery
  boundary.
- **R8:** Add fail-closed checker, documentation, hostile mutation, and hosted
  verification evidence.

## Implementation Units

### U1: Expand The Design Template

**File:** `docs/templates/lock-screen-permission-design.md`

Replace the broad data-handling prompts with a sensitive-data lifecycle section
that requires classification, storage, encryption, backup/transfer, retention,
deletion, restore validation, and diagnostic-redaction decisions.

### U2: Enforce The Lifecycle Contract

**File:** `scripts/check-baseline.sh`

Require the new section and each decision prompt, completed plan evidence, and
repository guidance while retaining all existing empty-repository checks.

### U3: Document And Verify

**Files:** `AGENTS.md`, `README.md`, `SECURITY.md`, `VISION.md`, `CHANGES.md`,
`docs/plans/2026-06-13-lock-screen-sensitive-data-lifecycle.md`

Document that implementation cannot begin until sensitive-data lifecycle and
backup boundaries are explicit.

## Test Scenarios

- The complete template passes the SDK-free repository baseline.
- Removing storage location, encryption, backup, device-transfer, retention,
  deletion, restore-validation, or diagnostic-redaction prompts fails.
- Removing guidance or reverting plan completion fails.
- Existing implementation-artifact, workflow, permission, credential,
  accessibility, overlay, component, and emergency mutations remain rejected.

## Scope Boundaries

- Do not add Android source, Gradle files, manifests, permissions, or runtime
  claims.
- Do not select a concrete storage or backup policy before an implementation
  design identifies actual data categories and supported Android versions.

## Verification

- An isolated repository copy passed `make check`, covering shell syntax, the
  SDK-free baseline through lint and test gates, and the intentionally skipped
  build gate because no Android project exists.
- Twelve hostile mutations were rejected: each of the nine lifecycle decision
  prompts, the backup/transfer/restore verification prompt, an Android
  implementation artifact, and plan-status rollback.
- Canonical and external-directory `make check` both passed against the exact
  completed implementation with the same shell, SDK-free lint/test, and
  intentional no-project build-skip coverage.

## Sources

- Android Auto Backup documentation:
  https://developer.android.com/identity/data/autobackup
- Android sensitive external-storage risk guidance:
  https://developer.android.com/privacy-and-security/risks/sensitive-data-external-storage
- Android log information disclosure guidance:
  https://developer.android.com/privacy-and-security/risks/log-info-disclosure
