# Lock Screen Task And Component Boundaries

Status: Completed

## Context

The permission design template covers authentication, overlays, emergency UI,
background work, and recovery. It does not explicitly require future designs
to define Android component exposure or task-navigation behavior. Exported
components, external intents, task snapshots, or recreation paths can expose
sensitive state or bypass intended lock-screen transitions even when the main
UI is otherwise hardened.

## Changes

- Add an activity, task, and component boundary section to the design template.
- Require an inventory and justification for exported Android components.
- Require external intent, deep-link, and PendingIntent validation boundaries.
- Require Back, Home, Overview, task-switching, and recents-snapshot behavior.
- Require safe state restoration after configuration changes and process
  recreation.
- Extend README, SECURITY, VISION, and the SDK-free baseline with the boundary.

## Verification

- `make check`
- Mutation check for a removed exported-component prompt
- `sh -n scripts/check-baseline.sh`
- `git diff --check`

The repository intentionally contains no Android implementation, so runtime
task and component behavior remains a future device-verification requirement.
