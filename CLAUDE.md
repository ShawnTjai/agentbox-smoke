# CLAUDE.md

Guidance for agents working in this repository.

## About

`agentbox-smoke` is a throwaway repository used for agentbox acceptance tests. It has no application code — just a README and a shell-based test.

## Commands

- **Test:** `bash tests/run.sh`
  - Runs the smoke test (currently checks that `README.md` has the expected title). CI runs this same command via `.github/workflows/tests.yml` (job `tests`), which is a required status check on `main`.
- **Lint:** not set up.
- **Format:** not set up.

## Lint / format tooling

No lint or format tooling is configured in this repository yet. There is no `package.json` or other language/toolchain manifest, so there is nothing to lint or format today.

If code is added later, set up the tooling appropriate to that language and record the exact commands here, for example:

- A shell-heavy repo could add [`shellcheck`](https://www.shellcheck.net/) for linting and [`shfmt`](https://github.com/mvdan/sh) for formatting.
- A JavaScript/TypeScript repo could add ESLint and Prettier and expose `npm run lint` / `npm run format`.

Do not invent a lint or format command that is not actually wired up — update this file when the tooling is genuinely added.
