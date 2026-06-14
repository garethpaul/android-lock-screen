# Lock-Screen Make Root Override Protection

Status: Planned

## Problem

The Makefile derives its repository root from its own location, but GNU Make
command-line variables override an ordinary assignment. A hostile `ROOT` value
can redirect all three SDK-free baseline invocations away from the reviewed
checkout.

## Requirements

1. Protect the Makefile-derived root with GNU Make's `override` directive.
2. Preserve every target, the empty-repository build skip, and all existing
   baseline behavior.
3. Require the exact protected root, all three rooted baseline invocations,
   the guarded build message, target ordering, and completed plan evidence.
4. Pass local, external-directory, and hostile-root `make check` gates.
5. Reject focused root, path, target, build-message, and completed-plan
   mutations.

## Verification

- Run shell syntax and the dependency-free baseline checker first.
- Run bounded local, external-directory, and hostile command-line `ROOT`
  `make check` gates.
- Run focused mutations plus workflow YAML, SVG XML, artifact,
  conflict-marker, whitespace, and changed-line credential audits.

## Scope Boundaries

- Do not add Android, Gradle, application, source, resource, or test
  scaffolding while the empty-repository contract remains active.
- Do not change permission-design, platform-ownership, sensitive-data, or
  security boundaries.
- Do not merge or close any pull request without explicit owner authorization.
