# Lock Screen Emergency And System UI Invariants

## Status: Completed

## Context

The permission design template covered consent, device administration,
accessibility, credentials, threat modeling, background execution, data, and
uninstall recovery. It did not explicitly require future designs to preserve
emergency access and critical platform UI during normal operation or failure.

## Objectives

- Preserve emergency calling and emergency information access.
- Keep incoming calls, alarms, critical alerts, and platform authentication UI
  unobscured.
- Define fail-safe behavior for process death, crash loops, reboot, direct boot,
  unknown lock state, and safe-mode recovery.
- Keep the repository implementation-free until these boundaries are answered.

## Work Completed

- Added `Emergency And System UI Invariants` to the design template.
- Added explicit prompts for emergency access, critical UI, failure behavior,
  and recovery.
- Extended the SDK-free baseline to require the section, prompts, documentation,
  and this completed plan.
- Made Make targets location-independent and pinned hosted CI to Ubuntu 24.04
  with workflow concurrency.

## Verification

- `make check`
- `make -f /absolute/path/to/Makefile check` from outside the repository
- emergency-invariant and automation mutation checks
- `sh -n scripts/check-baseline.sh`
- `git diff --check`
