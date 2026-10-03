#!/bin/bash
# convert_one.sh <FUNNAME> <srcfile.c> -- add src to LINKED_C_SRCS, carve, build, compare
set -e
cd "$(dirname "$0")/../.."
FUN=$1
SRC=$2
OBJ=src/${SRC%.c}.o
# add to LINKED_C_SRCS if not present
python3 - "$SRC" <<'EOF'
import re, sys
p='Makefile'
s=open(p).read()
src=sys.argv[1]
m=re.search(r'^LINKED_C_SRCS  := (.*)$', s, re.M)
cur=m.group(1)
if src not in cur.split():
    s=s[:m.start(1)] + cur + ' ' + src + s[m.end(1):]
    open(p,'w').write(s)
    print('Makefile: added', src)
else:
    print('Makefile: already present')
EOF
python3 tools/scripts/carve_function.py "$FUN" --object "$OBJ"
make compare-arm9 2>&1 | grep -Ev 'winediag|fixme' | tail -5