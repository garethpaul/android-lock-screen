# Changes

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
