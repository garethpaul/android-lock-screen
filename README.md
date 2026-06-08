# Android Lock Screen

<!-- README-OVERVIEW-IMAGE -->
![Project overview](docs/readme-overview.svg)

This repository is currently an empty placeholder. No Android implementation,
Gradle project, tests, or app behavior have been committed yet.

## Future Baseline

Before app code is added, establish:

- A checked-in Gradle wrapper and Android Gradle Plugin version.
- Documented compile SDK, target SDK, and minimum SDK choices.
- A local test or source-check command that runs without device access.
- A build command that produces a debug APK in a configured Android SDK.
- CI or documented local gates for formatting, tests, and build verification.

## Verify

Run the repository baseline check:

```sh
scripts/check-baseline.sh
```

This check does not require an Android SDK because there is no Android project
to build yet.

## Change Log

Repository maintenance changes are recorded in `CHANGES.md` until an Android
project exists with release notes or app-version metadata.
