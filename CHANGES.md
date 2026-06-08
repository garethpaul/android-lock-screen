# Changes

## 2026-06-08

- Tightened the empty-repository README contract so generated docs cannot imply
  a Gradle build or test suite exists before Android code is added.
- Added a repository changelog for the empty Android lock-screen baseline.
- Extended the SDK-free baseline check to require the changelog and README
  change-log documentation.
- Added a `make check` wrapper and Android/Gradle ignore rules for generated
  artifacts and local SDK configuration.
