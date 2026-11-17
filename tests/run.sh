#!/usr/bin/env bash
# Test runner for agentbox-smoke.
#
# Discovers and runs every `*.test.sh` file under tests/. The suite FAILS on an
# empty suite: if no test files are found, the runner exits non-zero, so the
# `tests` CI check can never pass by virtue of there being nothing to run.
set -uo pipefail

here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$here/.."

mapfile -t tests < <(find tests -type f -name '*.test.sh' | sort)

if [ "${#tests[@]}" -eq 0 ]; then
  echo "FAIL: no tests found under tests/ (empty suite)." >&2
  echo "Add at least one tests/<name>.test.sh - see CLAUDE.md." >&2
  exit 1
fi

failed=0
for t in "${tests[@]}"; do
  echo "== running $t =="
  if bash "$t"; then
    echo "PASS: $t"
  else
    echo "FAIL: $t" >&2
    failed=$((failed + 1))
  fi
done

echo
if [ "$failed" -ne 0 ]; then
  echo "$failed of ${#tests[@]} test file(s) failed." >&2
  exit 1
fi
echo "All ${#tests[@]} test file(s) passed."
