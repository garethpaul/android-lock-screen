# Empty-Implementation Symlink Boundary

Status: Completed

## Problem

The empty-repository scanner rejected real directories named `src`, `app`,
`Application`, or `gradle`, but `find` classified a symlink with one of those
names as neither a directory nor one of the separately named implementation
files. A checkout could therefore contain `src` pointing to Android code
outside the repository while the baseline still reported no implementation.

## Design

- Treat both real directories and symlinks with Android source or Gradle
  directory-role names as implementation artifacts.
- Do not follow symlinks or inspect their targets.
- Preserve recursive detection for manifests, wrappers, Java, Kotlin, AIDL,
  Gradle build files, and version catalogs.

## Alternatives

- Following symlinks would expand verification beyond the checkout and could
  traverse unbounded or attacker-controlled filesystem trees.
- Rejecting every symlink would be broader than the empty Android artifact
  contract and could block unrelated documentation links later.
- Resolving only the target and checking its contents would still make the
  repository result depend on external mutable state.

## Scope Boundaries

- Do not add Android implementation, Gradle configuration, SDK requirements,
  or runtime claims.
- Do not change workflow, design-template, or guarded build behavior.

## Work Completed

- Extended the artifact classifier to include symlinked directory roles.
- Added an isolated hostile `src -> /tmp` mutation.
- Updated repository guidance, changelog, and static completion contracts.

## Verification Completed

- The new hostile mutation failed before implementation because the baseline
  accepted a symlinked `src` directory role.
- The focused hostile suite and baseline pass after implementation.
- All 13 isolated hostile mutations pass after implementation.
- `make lint`, `make test`, `make build`, `make verify`, and `make check` pass
  from the repository and through an absolute Makefile path outside it; the
  guarded build truthfully reports that no Android project exists.
- Shell syntax, whitespace, conflict-marker, generated-artifact, and
  credential-shaped text audits pass.
- Restoring directory-only classification makes the symlink mutation fail.
