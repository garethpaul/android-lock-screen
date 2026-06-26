# Changes

## 2026-06-26

- Added multi-user and profile boundaries for primary, secondary, guest,
  managed work, clone, and private profiles before implementation can land.
- Required per-user authority and state, user/profile switching, cross-user API
  restrictions, in-flight work invalidation, cleanup, and fail-safe recovery.
- Added manual verification cases and four hostile mutations for section,
  cross-user, switch-state, and isolation-matrix removal.

## 2026-06-19

- Hardened the empty-repository gate against Kotlin DSL, nested manifests,
  Android source, and Gradle wrapper artifacts.
- Added isolated hostile mutation tests for implementation and CI privilege
  bypasses, including write scopes and explicit checkout tokens.

## 2026-06-15

- Added background-execution and direct-boot lifecycle boundaries for component
  ownership, storage availability, foreground disclosure, scheduling, restart,
  cancellation, force-stop, permission loss, and feature disable.

## 2026-06-14

- Added authentication-attempt handling boundaries for throttling, durable
  state, monotonic time, concurrency, reset conditions, diagnostics, recovery,
  and manual verification before credential-adjacent implementation.

## 2026-06-13

- Added platform ownership and capability boundaries for normal activities,
  launchers, screen pinning, managed lock task, and secure Keyguard limits.
- Added sensitive-data lifecycle boundaries for classification, storage,
  encryption, backup, device transfer, retention, deletion, restore validation,
  and production diagnostic redaction before implementation begins.

## 2026-06-12

- Disabled persisted checkout credentials and enforced the sole pinned
  credential-free workflow boundary.
- Added activity, task, and component boundary prompts covering exported
  components, external intents, system navigation, recents privacy, and state
  restoration before future lock-screen implementation.

## 2026-06-10

- Added emergency and system UI invariant prompts for future lock-screen
  designs, covering emergency access, calls/alarms, platform authentication,
  crash/reboot fail-safes, and safe-mode recovery.
- Added overlay and input integrity prompts covering draw-over-apps permissions,
  obscured touches, screen capture, accessibility overlays, and tapjacking.
- Made the empty-repository checks location-independent and pinned CI to Ubuntu
  24.04 with superseded-run cancellation.
- Added a pinned, read-only GitHub Actions check workflow that runs the existing
  empty-repository `make check` baseline with a bounded timeout.
- Added an SDK-free guard requiring the CI workflow and completed CI baseline
  plan to remain checked in.

## 2026-06-09

- Added an empty-implementation gate so Gradle files or Android source
  directories cannot land while the repository still claims no implementation.
- Added accessibility-service boundary prompts to the lock-screen design
  template and SDK-free guards requiring future plans to keep them.
- Added credential and biometric boundary prompts to the lock-screen design
  template and SDK-free guards requiring future plans to keep them.
- Added a threat-model section to the lock-screen permission design template
  and an SDK-free guard requiring future plans to keep it.
- Added SDK-free `make lint`, `make test`, and guarded `make build` targets so
  the empty repository still exposes the standard pre-push gate names.
- Added a lock-screen permission/security design template and SDK-free checks
  requiring future implementation work to use it before code lands.
- Updated `VISION.md` to reflect the current documentation baseline while
  preserving the no-implementation warning.

## 2026-06-08

- Tightened the empty-repository README contract so generated docs cannot imply
  a Gradle build or test suite exists before Android code is added.
- Added a repository changelog for the empty Android lock-screen baseline.
- Extended the SDK-free baseline check to require the changelog and README
  change-log documentation.
- Added a `make check` wrapper and Android/Gradle ignore rules for generated
  artifacts and local SDK configuration.
- Added a future lock-screen permission and consent design-note requirement
  before implementation code is introduced.
