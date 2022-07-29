## 0.2.0

- Added example project
- Changed mapping logic, labels are used as keys when provided, otherwise a part of stacktrace is provided.
- In case where stacktrace is used, only trace of relevant depth is considered to generate a unique hash to identify the location of function call.

## 0.1.0

- Trying different call stack hashing using `sha1` hashing for the whole call stack

## 0.0.1

- Create a Proof of Concept of Dart equivalent of `console.count()` in JavaScript
