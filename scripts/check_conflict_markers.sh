#!/usr/bin/env bash
set -euo pipefail

TARGETS=${*:-"index.html"}

if rg -n "<<<<<<<|=======|>>>>>>>" $TARGETS; then
  echo "❌ Git merge conflict markers found. Resolve them before commit."
  exit 1
fi

echo "✅ No Git merge conflict markers found in: $TARGETS"
