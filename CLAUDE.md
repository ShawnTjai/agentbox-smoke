# CLAUDE.md

Guidance for agents working in this repository.

## About

`agentbox-smoke` is a throwaway repository used for agentbox acceptance tests. It has no application code — just a README and a shell-based test. Everything in it is shell, so lint and format use shell tooling.

## Commands

- **Test:** `bash tests/run.sh`
  - Runs the smoke test (currently checks that `README.md` has the expected title). CI runs this same command via `.github/workflows/tests.yml` (job `tests`), which is a required status check on `main`.
- **Lint:** `bash tests/lint.sh`
  - Runs [`shellcheck`](https://www.shellcheck.net/) over every shell script in `tests/`. The `tests` CI job is unchanged; run this locally before pushing shell changes. `shellcheck` is preinstalled on GitHub `ubuntu-latest` runners.
- **Format:** `bash tests/format.sh`
  - Formats every shell script in `tests/` with [`shfmt`](https://github.com/mvdan/sh) (2-space indent). Pass `--check` (`bash tests/format.sh --check`) to verify formatting without writing.

## Lint / format tooling

This is a shell-only repository, so the wired-up tooling is [`shellcheck`](https://www.shellcheck.net/) for linting and [`shfmt`](https://github.com/mvdan/sh) for formatting, invoked through the `tests/lint.sh` and `tests/format.sh` wrappers above. Both wrappers exit with a clear message if the tool is not installed; install the tool locally (or rely on the runner's preinstalled `shellcheck`) before running.

If code in another language is added later, set up the tooling appropriate to that language and record the exact commands here too, for example ESLint and Prettier behind `npm run lint` / `npm run format` for a JavaScript/TypeScript repo.

Do not invent a lint or format command that is not actually wired up — update this file when the tooling is genuinely added.
