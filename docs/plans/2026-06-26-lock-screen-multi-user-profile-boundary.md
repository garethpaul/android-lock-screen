# Lock-Screen Multi-User/Profile Boundary

Status: Completed

## Goal

Require a complete Android user/profile ownership and lifecycle design before
any lock-screen implementation artifact can enter the repository.

## Work

- Added a dedicated multi-user/profile template section covering supported
  user types, ownership authority, per-user state, switching, cross-user APIs,
  in-flight work, cleanup, and fail-safe identity handling.
- Added manual cases for secondary users, guests, work profiles, user/profile
  switching, state isolation, and unauthorized cross-user calls.
- Updated repository guidance and the June 26 change record.
- Added four hostile mutations for removal of the section, cross-user boundary,
  switch-state handling, and isolation verification.

## Verification

- Red-first mutation: deleting the absent section initially survived, proving
  the baseline did not enforce this boundary.
- All hostile mutations were rejected after the contract was added.
- `make check` passed from the repository root and an external working
  directory.
- Shell syntax, whitespace, generated-artifact, and likely-secret audits
  passed.
- Hosted Check and CodeQL results are recorded on the pull request before
  merge.

## Runtime Boundary

No Android project, SDK, emulator, device, DPC enrollment, secondary user,
guest, or work profile exists in this repository. This change defines the
design and verification prerequisites only.
