#!/usr/bin/env bash
# Format every shell script in the repo with shfmt (2-space indent).
# Requires shfmt (https://github.com/mvdan/sh).
# Pass --check to verify formatting without writing (useful in CI).
set -euo pipefail

cd "$(dirname "$0")/.." || exit 1

if ! command -v shfmt >/dev/null 2>&1; then
  echo 'shfmt not found; install it from https://github.com/mvdan/sh' >&2
  exit 1
fi

if [[ "${1:-}" == "--check" ]]; then
  shfmt -i 2 -d tests/*.sh
  echo 'shfmt: formatting OK'
else
  shfmt -i 2 -w tests/*.sh
  echo 'shfmt: formatted'
fi
