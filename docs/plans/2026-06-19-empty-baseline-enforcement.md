# Empty Baseline Enforcement Deep Review

Status: Completed

## Problem

The empty-repository checker rejected a short list of top-level Groovy Gradle
paths, but modern Kotlin DSL files, nested Android manifests and source, and a
Gradle wrapper could pass. Its workflow checks also accepted additional write
permissions and explicit secret-backed checkout tokens.

## Decision

Keep the repository design-only. Strengthen the ownership boundary in the
baseline checker rather than adding speculative Android runtime code. Discover
Android and Gradle artifacts recursively, require the workflow permission map
to contain only `contents: read`, reject explicit tokens and repository-secret
references, and exercise those invariants with isolated hostile mutations.

## Verification

- Observed the original checker accept a Kotlin DSL Android build with a nested
  manifest.
- Observed the original checker accept `pull-requests: write` and an explicit
  secret-backed checkout token.
- Added regression tests that failed against the original checker before the
  implementation changed.
- Ran the hostile mutation suite and `make check` after the fix.
