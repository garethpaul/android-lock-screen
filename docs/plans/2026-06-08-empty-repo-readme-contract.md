# Empty Repository README Contract

## Goal

Keep generated README content honest while this repository has no Android
implementation or Gradle project.

## Red

- `scripts/check-baseline.sh` failed after the generated README dropped the
  empty-placeholder state and suggested Gradle run/test commands.
- Extended the baseline to require the SDK-free check command, require explicit
  "No Gradle project is checked in yet" wording, and reject Gradle assemble or
  test commands until a project exists.

## Green

- Restored the empty-placeholder state in the overview.
- Replaced Gradle run/test guidance with the existing `scripts/check-baseline.sh`
  verification command.
- Documented future Android baseline expectations and the `CHANGES.md`
  maintenance record.

## Verification

- `scripts/check-baseline.sh`
- `git diff --check`
