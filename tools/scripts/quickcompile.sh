#!/bin/sh
# compile one translation unit and dump its .text as thumb bytes
set -e
cd "$(dirname "$0")/../.."
src="$1"
obj="/tmp/$(basename "$src" .c).o"
wine tools/mwccarm/dsi/1.1/mwccarm.exe -DBLACK -DENGLISH -DPM_KEEP_ASSERTS -DSDK_ARM9 \
    -DSDK_CODE_ARM -DSDK_TS -O4,p -sym on -enum int -lang c99 -Cpp_exceptions off \
    -gccext,on -proc arm946e -msgstyle gcc -gccinc -i ./src -i ./include \
    -i ./include/msl -I././lib/NitroSDK/TwlSDK/include -ipa file -interworking \
    -inline on,noauto -char signed -thumb -W all -W pedantic -W noimpl_signedunsigned \
    -W noimplicitconv -W nounusedarg -W nomissingreturn -W error -c -o "$obj" "$src"
arm-none-eabi-objcopy -O binary --only-section=.text "$obj" "/tmp/$(basename "$src" .c).text"
od -An -tx1 -v "/tmp/$(basename "$src" .c).text" | tr -s ' ' | tr '\n' ' '
echo