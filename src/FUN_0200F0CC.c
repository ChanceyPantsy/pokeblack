#include "FUN_0200F0CC.h"

s32 FUN_0200F0CC(void *arg0, void *arg1, s32 *arg2) {
    u32 count = *(u16 *)((u8 *)arg0 + 4);
    u32 index = *arg2;
    u8 *entry;

    if (index < count) {
        entry = *(u8 **)((u8 *)arg0 + 0x18) + index * 0x100;

        while (1) {
            (*arg2)++;
            if (*(u32 *)entry & 1) {
                *(u8 **)arg1 = entry;
                return 1;
            }
            entry += 0x100;
            if ((u32)*arg2 < count) {
                continue;
            }
            break;
        }
    }

    return 0;
}