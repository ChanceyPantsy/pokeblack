#include "unk_0200E488.h"
#include "unk_0216736C.h"

u32 FUN_0200E488(u32 index, u32 count) {
    u32 offset = count - 1;
    u32 base = FUN_0216736C(index & 0xFF, count);

    return base + offset;
}