#!/usr/bin/env bash
# lane S helper: carve one function, emit C, verify compare-arm9, commit
set -euo pipefail
FUN="$1"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT="$(dirname "$SCRIPT_DIR")/.."
cd "$ROOT"

python3 tools/scripts/carve_function.py "$FUN" --object "src/unk_${FUN#FUN_}.o"
python3 tools/scripts/emit_accessor.py "$FUN"
make compare-arm9 2>&1 | tail -3
git add -A
git -c user.name="space-bunny-alpha (AI agent)" \
    -c user.email="space-bunny-alpha@users.noreply.github.com" \
    commit -q -m "decomp: $FUN as matching C"
echo "COMMITTED $FUN"
