#!/usr/bin/env sh
set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
PLAN_FILE="$ROOT_DIR/docs/plans/2026-06-08-empty-repo-baseline.md"
CI_WORKFLOW="$ROOT_DIR/.github/workflows/check.yml"
CI_PLAN_FILE="$ROOT_DIR/docs/plans/2026-06-10-ci-baseline.md"
SECURITY_PLAN_FILE="$ROOT_DIR/docs/plans/2026-06-09-lock-screen-permission-design-baseline.md"
DESIGN_TEMPLATE_FILE="$ROOT_DIR/docs/templates/lock-screen-permission-design.md"
SECURITY_FILE="$ROOT_DIR/SECURITY.md"
CREDENTIAL_BOUNDARY_PLAN_FILE="$ROOT_DIR/docs/plans/2026-06-09-lock-screen-credential-boundary-template.md"
ACCESSIBILITY_BOUNDARY_PLAN_FILE="$ROOT_DIR/docs/plans/2026-06-09-lock-screen-accessibility-boundary-template.md"
EMPTY_IMPLEMENTATION_GATE_PLAN_FILE="$ROOT_DIR/docs/plans/2026-06-09-lock-screen-empty-implementation-gate.md"
EMERGENCY_INVARIANTS_PLAN_FILE="$ROOT_DIR/docs/plans/2026-06-10-lock-screen-emergency-invariants.md"
OVERLAY_INTEGRITY_PLAN_FILE="$ROOT_DIR/docs/plans/2026-06-10-lock-screen-overlay-input-integrity.md"
TASK_COMPONENT_PLAN_FILE="$ROOT_DIR/docs/plans/2026-06-12-lock-screen-task-component-boundaries.md"
CHECKOUT_CREDENTIAL_PLAN_FILE="$ROOT_DIR/docs/plans/2026-06-12-checkout-credential-boundary.md"
DATA_LIFECYCLE_PLAN_FILE="$ROOT_DIR/docs/plans/2026-06-13-lock-screen-sensitive-data-lifecycle.md"
PLATFORM_OWNERSHIP_PLAN_FILE="$ROOT_DIR/docs/plans/2026-06-13-lock-screen-platform-ownership.md"

for path in \
  build.gradle \
  settings.gradle \
  gradlew \
  gradlew.bat \
  app \
  Application \
  src; do
  if [ -e "$ROOT_DIR/$path" ]; then
    printf '%s\n' "Empty repository baseline must be replaced before adding Android implementation artifacts: $path" >&2
    exit 1
  fi
done

if [ ! -f "$ROOT_DIR/README.md" ]; then
  printf '%s\n' "README.md is required for the empty repository baseline." >&2
  exit 1
fi

if [ ! -f "$PLAN_FILE" ]; then
  printf '%s\n' "Baseline plan is missing." >&2
  exit 1
fi

if [ ! -f "$CI_WORKFLOW" ]; then
  printf '%s\n' "GitHub Actions check workflow is missing." >&2
  exit 1
fi

if [ ! -f "$CI_PLAN_FILE" ]; then
  printf '%s\n' "Lock-screen CI baseline plan is missing." >&2
  exit 1
fi

if [ ! -f "$SECURITY_PLAN_FILE" ]; then
  printf '%s\n' "Future lock-screen permission design plan is missing." >&2
  exit 1
fi

if [ ! -f "$DESIGN_TEMPLATE_FILE" ]; then
  printf '%s\n' "Future lock-screen permission design template is missing." >&2
  exit 1
fi

if [ ! -f "$CREDENTIAL_BOUNDARY_PLAN_FILE" ]; then
  printf '%s\n' "Future lock-screen credential-boundary plan is missing." >&2
  exit 1
fi

if [ ! -f "$ACCESSIBILITY_BOUNDARY_PLAN_FILE" ]; then
  printf '%s\n' "Future lock-screen accessibility-boundary plan is missing." >&2
  exit 1
fi

if [ ! -f "$EMPTY_IMPLEMENTATION_GATE_PLAN_FILE" ]; then
  printf '%s\n' "Empty implementation gate plan is missing." >&2
  exit 1
fi

if [ ! -f "$EMERGENCY_INVARIANTS_PLAN_FILE" ]; then
  printf '%s\n' "Future lock-screen emergency-invariants plan is missing." >&2
  exit 1
fi

if [ ! -f "$OVERLAY_INTEGRITY_PLAN_FILE" ]; then
  printf '%s\n' "Future lock-screen overlay-integrity plan is missing." >&2
  exit 1
fi

if [ ! -f "$TASK_COMPONENT_PLAN_FILE" ]; then
  printf '%s\n' "Future lock-screen task/component boundary plan is missing." >&2
  exit 1
fi

if [ ! -f "$CHECKOUT_CREDENTIAL_PLAN_FILE" ]; then
  printf '%s\n' "Checkout credential boundary plan is missing." >&2
  exit 1
fi

if [ ! -f "$ROOT_DIR/CHANGES.md" ]; then
  printf '%s\n' "CHANGES.md is required for repository maintenance history." >&2
  exit 1
fi

if [ ! -f "$ROOT_DIR/Makefile" ]; then
  printf '%s\n' "Makefile is required for the repository check wrapper." >&2
  exit 1
fi

if [ ! -f "$ROOT_DIR/.gitignore" ]; then
  printf '%s\n' ".gitignore is required before Android scaffolding is added." >&2
  exit 1
fi

if ! grep -Fq "currently an empty placeholder" "$ROOT_DIR/README.md"; then
  printf '%s\n' "README must document the current empty repository state." >&2
  exit 1
fi

if grep -Fq "There is no checked-in implementation or README yet." "$ROOT_DIR/VISION.md"; then
  printf '%s\n' "VISION must not claim README.md is missing after baseline docs exist." >&2
  exit 1
fi

if ! grep -Fq "baseline README, changelog" "$ROOT_DIR/VISION.md"; then
  printf '%s\n' "VISION must describe the current documentation baseline." >&2
  exit 1
fi

if ! grep -Fq "implementation or Gradle project is checked in" "$ROOT_DIR/VISION.md"; then
  printf '%s\n' "VISION must still document the lack of Android implementation." >&2
  exit 1
fi

if ! grep -Fq "Future Baseline" "$ROOT_DIR/README.md"; then
  printf '%s\n' "README must document future Android baseline expectations." >&2
  exit 1
fi

if ! grep -Fq "CHANGES.md" "$ROOT_DIR/README.md"; then
  printf '%s\n' "README must document the repository change log." >&2
  exit 1
fi

if ! grep -Fq "scripts/check-baseline.sh" "$ROOT_DIR/README.md"; then
  printf '%s\n' "README must document the SDK-free baseline command." >&2
  exit 1
fi

if ! grep -Fq "make check" "$ROOT_DIR/README.md"; then
  printf '%s\n' "README must document the make check wrapper." >&2
  exit 1
fi

if ! grep -Fq "GitHub Actions" "$ROOT_DIR/README.md"; then
  printf '%s\n' "README must document the GitHub Actions baseline." >&2
  exit 1
fi

if ! grep -Fq "No Gradle project is checked in yet" "$ROOT_DIR/README.md"; then
  printf '%s\n' "README must not imply an Android build exists yet." >&2
  exit 1
fi

if ! grep -Fq "fails if Android implementation artifacts appear" "$ROOT_DIR/README.md"; then
  printf '%s\n' "README must document the empty implementation gate." >&2
  exit 1
fi

if ! grep -Fq "permission and consent design note" "$ROOT_DIR/README.md"; then
  printf '%s\n' "README must require a future permission and consent design note." >&2
  exit 1
fi

if ! grep -Fq "docs/templates/lock-screen-permission-design.md" "$ROOT_DIR/README.md"; then
  printf '%s\n' "README must link the future permission design template." >&2
  exit 1
fi

if ! grep -Fq "device-admin or device-owner behavior" "$ROOT_DIR/README.md"; then
  printf '%s\n' "README must call out future device-admin/device-owner behavior." >&2
  exit 1
fi

if ! grep -Fq "background execution" "$ROOT_DIR/README.md"; then
  printf '%s\n' "README must call out future background execution behavior." >&2
  exit 1
fi

if ! grep -Fq "scripts/check-baseline.sh" "$ROOT_DIR/Makefile"; then
  printf '%s\n' "Makefile must run the baseline script." >&2
  exit 1
fi

if ! grep -Fq "lint:" "$ROOT_DIR/Makefile"; then
  printf '%s\n' "Makefile must expose an SDK-free lint gate." >&2
  exit 1
fi

if ! grep -Fq "test:" "$ROOT_DIR/Makefile"; then
  printf '%s\n' "Makefile must expose an SDK-free test gate." >&2
  exit 1
fi

if ! grep -Fq "build:" "$ROOT_DIR/Makefile"; then
  printf '%s\n' "Makefile must expose a guarded build gate." >&2
  exit 1
fi

if ! grep -Fq "verify: lint test build" "$ROOT_DIR/Makefile"; then
  printf '%s\n' "Makefile verify must run lint, test, and build gates." >&2
  exit 1
fi

if ! grep -Fq "local.properties" "$ROOT_DIR/.gitignore"; then
  printf '%s\n' ".gitignore must exclude local Android SDK configuration." >&2
  exit 1
fi

for pattern in \
  "## Supported Android Versions" \
  "## Platform Ownership And Capability" \
  "## Permission And Consent Flow" \
  "## Device Admin Or Device Owner Behavior" \
  "## Threat Model" \
  "## Credential And Biometric Boundaries" \
  "## Overlay And Input Integrity" \
  "## Activity Task And Component Boundaries" \
  "## Accessibility Service Boundary" \
  "## Background Execution" \
  "## Emergency And System UI Invariants" \
  "## Sensitive Data Lifecycle" \
  "## Manual Verification Matrix" \
  "## Disable And Uninstall Path"; do
  if ! grep -Fq "$pattern" "$DESIGN_TEMPLATE_FILE"; then
    printf '%s\n' "Lock-screen design template is missing section: $pattern" >&2
    exit 1
  fi
done

for platform_ownership_prompt in \
  "Selected mode: normal Activity, launcher, screen pinning, or DPC-managed lock task" \
  "Platform APIs used and capability limits for the selected mode" \
  "Secure Keyguard credential and biometric boundary, including any fully managed-device exception" \
  "Device-owner or DPC enrollment and deprovisioning path, if required" \
  "Lock-task package allowlisting and system UI feature decisions, if required" \
  "Behavior when lock task is not permitted or ownership prerequisites are absent" \
  "User-visible exit, fallback, and recovery path for each supported mode" \
  "Lock-screen replacement, authentication-bypass, or device-ownership claims explicitly not made"; do
  if ! grep -Fq "$platform_ownership_prompt" "$DESIGN_TEMPLATE_FILE"; then
    printf '%s\n' "Lock-screen design template is missing platform-ownership prompt: $platform_ownership_prompt" >&2
    exit 1
  fi
done

for platform_verification_prompt in \
  "Normal unmanaged-device mode" \
  "Managed and lock-task-allowlisted device mode, if supported" \
  "Unsupported or unpermitted ownership state"; do
  if ! grep -Fq "$platform_verification_prompt" "$DESIGN_TEMPLATE_FILE"; then
    printf '%s\n' "Lock-screen verification matrix is missing ownership case: $platform_verification_prompt" >&2
    exit 1
  fi
done

if [ ! -f "$PLATFORM_OWNERSHIP_PLAN_FILE" ] || \
   ! grep -Fq "Status: Completed" "$PLATFORM_OWNERSHIP_PLAN_FILE" || \
   ! grep -Fq "## Verification Completed" "$PLATFORM_OWNERSHIP_PLAN_FILE" || \
   ! grep -Fq "make check" "$PLATFORM_OWNERSHIP_PLAN_FILE" || \
   ! grep -Fq "Fourteen hostile mutations" "$PLATFORM_OWNERSHIP_PLAN_FILE" || \
   ! grep -Fq "developer.android.com/work/dpc/dedicated-devices/lock-task-mode" "$PLATFORM_OWNERSHIP_PLAN_FILE"; then
  printf '%s\n' "Lock-screen platform ownership plan must record completed verification and sources." >&2
  exit 1
fi

for platform_ownership_doc in "$ROOT_DIR/AGENTS.md" "$ROOT_DIR/README.md" "$SECURITY_FILE" "$ROOT_DIR/VISION.md" "$ROOT_DIR/CHANGES.md"; do
  if ! tr '\n' ' ' < "$platform_ownership_doc" | tr -s '[:space:]' ' ' | \
      grep -Fiq "platform ownership and capability boundaries"; then
    printf '%s\n' "$platform_ownership_doc must document platform ownership and capability boundaries." >&2
    exit 1
  fi
done

DESIGN_TEMPLATE_NORMALIZED=$(tr '\n' ' ' < "$DESIGN_TEMPLATE_FILE" | tr -s '[:space:]' ' ')
for data_lifecycle_prompt in \
  "Data classification for lock state, account, device, credential-adjacent, biometric-adjacent, and diagnostic data" \
  "Internal versus external storage locations with justification" \
  "Encryption at rest and key-management boundary" \
  "Cloud backup inclusion or exclusion by persisted data category" \
  "Device-to-device transfer inclusion or exclusion by persisted data category" \
  "Retention period and deletion triggers" \
  "Cleanup on disable, sign-out, uninstall, and account removal" \
  "Restore validation before recovered state can affect lock-screen behavior" \
  "Production log, analytics, and crash-report redaction rules"; do
  if ! printf '%s\n' "$DESIGN_TEMPLATE_NORMALIZED" | grep -Fq "$data_lifecycle_prompt"; then
    printf '%s\n' "Lock-screen design template is missing data-lifecycle prompt: $data_lifecycle_prompt" >&2
    exit 1
  fi
done

if ! grep -Fq "Cloud backup, device-transfer, and restore behavior" "$DESIGN_TEMPLATE_FILE"; then
  printf '%s\n' "Lock-screen verification matrix must cover backup, transfer, and restore behavior." >&2
  exit 1
fi

if [ ! -f "$DATA_LIFECYCLE_PLAN_FILE" ] || \
   ! grep -Fq "Status: Completed" "$DATA_LIFECYCLE_PLAN_FILE" || \
   ! grep -Fq "make check" "$DATA_LIFECYCLE_PLAN_FILE" || \
   ! grep -Fq "hostile mutations" "$DATA_LIFECYCLE_PLAN_FILE"; then
  printf '%s\n' "Lock-screen sensitive-data lifecycle plan must record completed verification." >&2
  exit 1
fi

for data_lifecycle_doc in "$ROOT_DIR/AGENTS.md" "$ROOT_DIR/README.md" "$SECURITY_FILE" "$ROOT_DIR/VISION.md" "$ROOT_DIR/CHANGES.md"; do
  if ! tr '\n' ' ' < "$data_lifecycle_doc" | tr -s '[:space:]' ' ' | \
      grep -Fiq "sensitive-data lifecycle boundaries"; then
    printf '%s\n' "$data_lifecycle_doc must document sensitive-data lifecycle boundaries." >&2
    exit 1
  fi
done

for task_component_prompt in \
  "Exported activities, services, receivers, and providers with justification" \
  "External intent, deep-link, and PendingIntent validation" \
  "Back, Home, Overview, and task-switching behavior" \
  "Recents snapshot and task-preview privacy" \
  "State restoration after configuration change or process recreation" \
  "Manual verification for unauthorized component launches and task re-entry"; do
  if ! grep -Fq "$task_component_prompt" "$DESIGN_TEMPLATE_FILE"; then
    printf '%s\n' "Lock-screen design template is missing task/component prompt: $task_component_prompt" >&2
    exit 1
  fi
done

for overlay_prompt in \
  "Overlay or draw-over-other-apps permissions requested" \
  "Why standard Activity, Keyguard, or device-owner APIs are insufficient" \
  "Obscured and partially obscured touch rejection" \
  "Screenshot, screen recording, and screen-sharing boundaries" \
  "Accessibility overlay and trusted system UI behavior" \
  "Manual tapjacking and overlay-abuse verification"; do
  if ! grep -Fq "$overlay_prompt" "$DESIGN_TEMPLATE_FILE"; then
    printf '%s\n' "Lock-screen design template is missing input-integrity prompt: $overlay_prompt" >&2
    exit 1
  fi
done

for emergency_prompt in \
  "Emergency calling and emergency information access" \
  "Incoming calls, alarms, and critical system alerts" \
  "System credential and biometric UI that must remain unobscured" \
  "Behavior after process death, crash loops, reboot, and direct boot" \
  "Fail-safe behavior when lock-screen state cannot be determined" \
  "Recovery through safe mode or platform settings"; do
  if ! grep -Fq "$emergency_prompt" "$DESIGN_TEMPLATE_FILE"; then
    printf '%s\n' "Lock-screen design template is missing invariant: $emergency_prompt" >&2
    exit 1
  fi
done

if grep -Fq "gradle assembleDebug" "$ROOT_DIR/README.md"; then
  printf '%s\n' "README must not document Gradle assembly before a project exists." >&2
  exit 1
fi

if grep -Fq "gradle test" "$ROOT_DIR/README.md"; then
  printf '%s\n' "README must not document Gradle tests before a project exists." >&2
  exit 1
fi

if ! grep -Fq "threat model" "$ROOT_DIR/README.md"; then
  printf '%s\n' "README must require a future lock-screen threat model." >&2
  exit 1
fi

if ! grep -Fq "credential and biometric boundaries" "$ROOT_DIR/README.md"; then
  printf '%s\n' "README must require future credential and biometric boundaries." >&2
  exit 1
fi

if ! grep -Fq "accessibility-service boundaries" "$ROOT_DIR/README.md"; then
  printf '%s\n' "README must require future accessibility-service boundaries." >&2
  exit 1
fi

if ! grep -Fq "emergency and system UI invariants" "$ROOT_DIR/README.md"; then
  printf '%s\n' "README must require future emergency and system UI invariants." >&2
  exit 1
fi

if ! grep -Fq "overlay and input integrity boundaries" "$ROOT_DIR/README.md"; then
  printf '%s\n' "README must require future overlay and input integrity boundaries." >&2
  exit 1
fi

if ! grep -Fq "activity/task/component boundaries" "$ROOT_DIR/README.md"; then
  printf '%s\n' "README must require future activity/task/component boundaries." >&2
  exit 1
fi

if ! grep -Fq "credential and biometric boundaries" "$SECURITY_FILE"; then
  printf '%s\n' "SECURITY must document future credential and biometric boundaries." >&2
  exit 1
fi

if ! grep -Fq "accessibility-service boundaries" "$SECURITY_FILE"; then
  printf '%s\n' "SECURITY must document future accessibility-service boundaries." >&2
  exit 1
fi

if ! grep -Fq "emergency and system UI invariants" "$SECURITY_FILE"; then
  printf '%s\n' "SECURITY must document future emergency and system UI invariants." >&2
  exit 1
fi

if ! grep -Fq "overlay and input integrity boundaries" "$SECURITY_FILE"; then
  printf '%s\n' "SECURITY must document future overlay and input integrity boundaries." >&2
  exit 1
fi

if ! grep -Fq "activity, task, and component boundaries" "$SECURITY_FILE"; then
  printf '%s\n' "SECURITY must document future activity, task, and component boundaries." >&2
  exit 1
fi

if ! grep -Fq "make check" "$ROOT_DIR/docs/plans/2026-06-09-lock-screen-threat-model-template.md"; then
  printf '%s\n' "Lock-screen threat-model template plan must document make check verification." >&2
  exit 1
fi

if ! grep -Fq "make check" "$CREDENTIAL_BOUNDARY_PLAN_FILE"; then
  printf '%s\n' "Lock-screen credential-boundary plan must document make check verification." >&2
  exit 1
fi

if ! grep -Fq "make check" "$ACCESSIBILITY_BOUNDARY_PLAN_FILE"; then
  printf '%s\n' "Lock-screen accessibility-boundary plan must document make check verification." >&2
  exit 1
fi

if ! grep -Fq "make check" "$EMPTY_IMPLEMENTATION_GATE_PLAN_FILE"; then
  printf '%s\n' "Lock-screen empty implementation gate plan must document make check verification." >&2
  exit 1
fi

if ! grep -Fq "Status: Completed" "$EMERGENCY_INVARIANTS_PLAN_FILE" ||
   ! grep -Fq "make check" "$EMERGENCY_INVARIANTS_PLAN_FILE"; then
  printf '%s\n' "Emergency-invariants plan must record completed make check verification." >&2
  exit 1
fi

if ! grep -Fq "Status: Completed" "$OVERLAY_INTEGRITY_PLAN_FILE" ||
   ! grep -Fq "make check" "$OVERLAY_INTEGRITY_PLAN_FILE"; then
  printf '%s\n' "Overlay-integrity plan must record completed make check verification." >&2
  exit 1
fi

if ! grep -Fq "Status: Completed" "$TASK_COMPONENT_PLAN_FILE" ||
   ! grep -Fq "make check" "$TASK_COMPONENT_PLAN_FILE"; then
  printf '%s\n' "Task/component boundary plan must record completed make check verification." >&2
  exit 1
fi

for workflow_contract in \
  "permissions:" \
  "contents: read" \
  "runs-on: ubuntu-24.04" \
  "cancel-in-progress: true" \
  "timeout-minutes: 5" \
  "workflow_dispatch:" \
  "actions/checkout@df4cb1c069e1874edd31b4311f1884172cec0e10" \
  "run: make check"; do
  if ! grep -Fq "$workflow_contract" "$CI_WORKFLOW"; then
    printf '%s\n' "GitHub Actions check workflow must keep contract: $workflow_contract" >&2
    exit 1
  fi
done

workflow_files=$(find "$ROOT_DIR/.github/workflows" -mindepth 1 -maxdepth 1 -type f -print | sort)
if [ "$workflow_files" != "$CI_WORKFLOW" ]; then
  printf '%s\n' "GitHub Actions workflow inventory must contain only check.yml." >&2
  exit 1
fi

if ! awk '
  function finish_step() {
    if (checkout) {
      checkout_count++
      if (with_block && persist_false) {
        secure_checkout_count++
      }
    }
    checkout = 0
    with_block = 0
    persist_false = 0
  }
  /^      - / { finish_step() }
  /^        uses: actions\/checkout@df4cb1c069e1874edd31b4311f1884172cec0e10 # v6\.0\.3$/ { checkout = 1 }
  checkout && /^        with:$/ { with_block = 1 }
  checkout && with_block && /^          persist-credentials: false$/ { persist_false = 1 }
  END {
    finish_step()
    exit !(checkout_count == 1 && secure_checkout_count == 1)
  }
' "$CI_WORKFLOW" ||
   [ "$(grep -Fc "persist-credentials:" "$CI_WORKFLOW")" -ne 1 ] ||
   grep -Fq "persist-credentials: true" "$CI_WORKFLOW"; then
  printf '%s\n' "GitHub Actions must use one pinned credential-free checkout." >&2
  exit 1
fi

if ! grep -Fq "status: completed" "$CHECKOUT_CREDENTIAL_PLAN_FILE" ||
   ! grep -Fq "persist-credentials: false" "$CHECKOUT_CREDENTIAL_PLAN_FILE" ||
   ! grep -Fq "hostile mutations rejected" "$CHECKOUT_CREDENTIAL_PLAN_FILE"; then
  printf '%s\n' "Checkout credential plan must record completed verification." >&2
  exit 1
fi

guidance=$(cat "$ROOT_DIR/README.md" "$ROOT_DIR/SECURITY.md" "$ROOT_DIR/VISION.md" "$ROOT_DIR/CHANGES.md" | tr '\n' ' ')
case "$guidance" in
  *"checkout credentials are not persisted"*"credential-free checkout"*) ;;
  *)
    printf '%s\n' "Repository guidance must document the credential-free checkout boundary." >&2
    exit 1
    ;;
esac


if ! grep -Fxq 'override ROOT := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))' "$ROOT_DIR/Makefile"; then
  printf '%s\n' "Makefile must protect repository paths from command-line overrides." >&2
  exit 1
fi

if [ "$(grep -Fc '$(ROOT)scripts/check-baseline.sh' "$ROOT_DIR/Makefile")" -ne 3 ]; then
  printf '%s\n' "All three SDK-free baseline commands must use the protected root." >&2
  exit 1
fi

if ! grep -Fxq 'verify: lint test build' "$ROOT_DIR/Makefile" || \
   ! grep -Fxq 'check: verify' "$ROOT_DIR/Makefile"; then
  printf '%s\n' "Makefile must preserve lint, test, build, verify, and check ordering." >&2
  exit 1
fi

make_tab=$(printf '\t')
if ! grep -Fxq "${make_tab}@echo \"No Android project is checked in yet; build skipped.\"" "$ROOT_DIR/Makefile"; then
  printf '%s\n' "Makefile must preserve the explicit empty-project build skip." >&2
  exit 1
fi

if ! grep -Fxq "Status: Completed" "$ROOT_DIR/docs/plans/2026-06-14-lock-screen-make-root-override-protection.md"; then
  printf '%s\n' "Lock-screen Make root protection plan must record completed status." >&2
  exit 1
fi

if ! grep -Fq "Status: Completed" "$CI_PLAN_FILE" || ! grep -Fq "make check" "$CI_PLAN_FILE"; then
  printf '%s\n' "Lock-screen CI baseline plan must record completed status and make check verification." >&2
  exit 1
fi

printf '%s\n' "Android lock screen baseline checks passed."
