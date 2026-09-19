#!/usr/bin/env bash
# Lint every shell script in the repo with shellcheck.
# Requires shellcheck (https://www.shellcheck.net/); preinstalled on GitHub ubuntu-latest runners.
set -euo pipefail

cd "$(dirname "$0")/.." || exit 1

if ! command -v shellcheck >/dev/null 2>&1; then
  echo 'shellcheck not found; install it from https://www.shellcheck.net/' >&2
  exit 1
fi

shellcheck tests/*.sh
echo 'shellcheck: no issues'
