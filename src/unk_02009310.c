#include "unk_02009310.h"

u32 FUN_02009310(void *obj, s32 index) {
    if (index > 0x14) {
        return 0;
    }

    u32 value = *(u16 *)((u8 *)obj + index * 2 + 0xE4);

    if (value > 0x272) {
        return 0;
    }

    return value;
}