# DO6 — CI/CD

> School 21 DevOps Track · January 2026

Setting up a basic CI/CD pipeline — automated build, code style check, and deployment of a C project.

---

## What Was Done

- Configured a CI/CD pipeline that triggers automatically on every push
- **Stage 1 — Build:** compiles `main.c` using `make` (outputs binary `DO`)
- **Stage 2 — Codestyle:** checks formatting with `clang-format`
- **Stage 3 — Test:** runs the compiled binary with arguments 1–6 and verifies output
- **Stage 4 — Deploy:** deploys the artifact to a target environment
- Set up notifications on pipeline success/failure

## The Project Being Built

A simple C program that takes a number (1–6) and prints the corresponding DevOps topic:

```c
./DO 5
// Learning to Docker
```

## Files

```
code-samples/
├── main.c      # C source
├── Makefile    # build: gcc main.c -o DO
└── DO          # compiled binary
```

## Tools Used

`CI/CD` · `gcc` · `make` · `clang-format` · `bash`
