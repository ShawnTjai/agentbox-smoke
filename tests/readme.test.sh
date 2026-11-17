#!/usr/bin/env bash
# Checks that README.md has the expected title.
set -euo pipefail
grep -q '^# agentbox-smoke' README.md && echo 'README title present' || {
  echo 'README title missing'
  exit 1
}
