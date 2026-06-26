# Lock-Screen Multi-User/Profile Boundary Design

## Problem

The lock-screen design gate covered device ownership, credentials, sensitive
data, direct boot, and lifecycle recovery, but it did not require a future
implementation to define which Android user or profile owns lock state and
policy. Secondary users, guests, managed work profiles, clone/private profiles,
and user switching could therefore reuse stale state, cross storage scopes, or
apply policy to the wrong person.

## Options

1. Treat the device as single-user. This is not a safe default because Android
   supports distinct users and profiles with separate app data and policy.
2. Mention users only in the existing sensitive-data section. This misses
   authority, switching, in-flight work, cross-user calls, and removal.
3. Add a dedicated multi-user/profile section and manual matrix.

## Decision

Use option 3. Future implementation plans must identify supported user and
profile types, authority scope, per-user state, lifecycle transitions,
cross-user APIs, cleanup, and fail-safe behavior. The gate remains
implementation-free.

## Platform References

- [AOSP: Build multiuser-aware apps](https://source.android.com/docs/devices/admin/multiuser-apps)
- [Android Enterprise: Work profiles](https://developer.android.com/work/managed-profiles)
- [Android `UserManager`](https://developer.android.com/reference/android/os/UserManager)
