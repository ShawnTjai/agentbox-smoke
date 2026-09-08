#!/usr/bin/env bash
set -euo pipefail
grep -q '^# agentbox-smoke' README.md && echo 'README title present' || { echo 'README title missing'; exit 1; }
