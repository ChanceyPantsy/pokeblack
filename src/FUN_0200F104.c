#include "FUN_0200F104.h"

void *FUN_0200F104(void *arg0) {
    s32 i = 0;
    s32 count = *(u16 *)((u8 *)arg0 + 4);
    u8 *entry = *(u8 **)((u8 *)arg0 + 0x18);

    while (1) {
        if (!(*(u32 *)entry & 1)) {
            return entry;
        }
        i++;
        entry += 0x100;
        if (i >= count) {
            break;
        }
    }

    return 0;
}