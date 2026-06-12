# Checkout Credential Boundary

status: completed

## Context

Canonical PR #1 runs an SDK-free, read-only empty-repository baseline and
performs no authenticated Git operation after checkout, but the action default
retained the workflow token in the runner's Git configuration.

## Implementation

- Set `persist-credentials: false` on the one commit-pinned checkout step.
- Require exactly one checkout action and only the canonical workflow file.
- Preserve Ubuntu 24.04, read-only permission, timeout, concurrency, and
  `make check` command.
- Preserve the implementation-free gate and every future lock-screen security
  design boundary.

## Verification

- `make lint`, `make test`, `make build`, and `make check` passed.
- The checker passed from an external working directory.
- Workflow YAML parsing, shell syntax, and `git diff --check` passed.
- Focused hostile mutations rejected a missing or true credential setting,
  duplicate checkout action, extra workflow file, incomplete plan, stale
  documentation, and an added Android implementation artifact; all hostile
  mutations rejected.
- Exact-head hosted verification remains pending until this successor is
  pushed.

## Boundaries

- Do not add Android implementation or Gradle scaffolding in this unit.
- Do not weaken permission, consent, credential, accessibility, emergency,
  overlay/input, or task/component design requirements.
- Do not add post-checkout pushes, tags, or authenticated Git fetches.
