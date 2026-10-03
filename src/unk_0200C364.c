#include "unk_0200C364.h"

void FUN_0200C364(u16 *arg0, u32 arg1, u32 arg2) {
    u16 *ptr = (u16 *)((u8 *)arg0 + 0x4a);
    u32 sum = ptr[arg1];

    sum += arg2;

    if (sum > 0xFFFF) {
        sum = 0xFFFF;
    }

    ptr[arg1] = sum;
}