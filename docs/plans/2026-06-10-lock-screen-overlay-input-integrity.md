# Lock Screen Overlay And Input Integrity

Status: Completed

## Context

The future lock-screen design template covered permissions, authentication,
accessibility, emergency behavior, and recovery, but it did not require a plan
for overlays or untrusted input. Authentication-adjacent UI can still be
spoofed, captured, or tapjacked when obscured touches and screen-sharing
boundaries are unspecified.

## Changes

- Add a dedicated overlay and input integrity section to the design template.
- Require justification for draw-over-other-apps behavior and preference for
  standard Activity, Keyguard, or device-owner APIs.
- Require obscured-touch, screen-capture, accessibility-overlay, and trusted
  system UI boundaries.
- Require manual tapjacking and overlay-abuse verification.
- Enforce the prompts and policy language through the SDK-free baseline.

## Verification

- `make check`
- Mutation check for a removed obscured-touch prompt
- `git diff --check`
