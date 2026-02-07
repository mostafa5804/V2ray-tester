#!/usr/bin/env bash
set -euo pipefail

TARGETS=${*:-"index.html"}

# Detect real git conflict markers and common leftover branch-label lines
# that have previously leaked into index.html and broken JS parsing.
PATTERN='^\s*(<<<<<<<\s+.+|=======|>>>>>>>\s+.+|main|codex/optimize-code-performance-[[:alnum:]-]+)\s*$'

if rg -n "$PATTERN" $TARGETS; then
  echo "❌ Conflict artifacts found. Resolve them before commit/deploy."
  exit 1
fi

echo "✅ No conflict artifacts found in: $TARGETS"
