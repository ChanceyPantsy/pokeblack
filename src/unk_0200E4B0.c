#include "unk_0200E4B0.h"
#include "unk_0200E488.h"

u32 FUN_0200E4B0(void *obj, u32 index, u32 count) {
    if (count == 0) {
        return 0;
    }

    return ((u8 *)obj + FUN_0200E488(index, count))[0x3C];
}