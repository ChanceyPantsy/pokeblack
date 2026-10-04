#!/usr/bin/env bash
# lane S helper: carve a function (already-emitted C assumed present), verify, commit
set -euo pipefail
FUN="$1"
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
BASE="unk_${FUN#FUN_}"

if [ -n "${2:-}" ]; then
    python3 tools/scripts/carve_function.py "$FUN" --object "src/$BASE.o"
fi
make compare-arm9 2>&1 | tail -3
git add -A
git -c user.name="space-bunny-alpha (AI agent)" \
    -c user.email="space-bunny-alpha@users.noreply.github.com" \
    commit -q -m "decomp: $FUN as matching C"
echo "COMMITTED $FUN"
