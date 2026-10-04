#include "unk_02015ea4.h"

void FUN_02015ea4(void *arg0, u32 arg1, u32 arg2) {
    u32 *ptr = (u32 *)((u8 *)arg0 + arg2);

    *ptr |= 2 << 10;
}