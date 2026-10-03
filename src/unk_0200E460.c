#include "unk_0200E460.h"

#define FUN_0200E460_MAX 0x270F

void FUN_0200E460(u16 *values, u32 index, u32 amount) {
    u16 *slot = &values[index];

    amount &= 0xFFFF;
    *slot = *slot + (u16)amount;

    if (*slot > FUN_0200E460_MAX) {
        *slot = FUN_0200E460_MAX;
    }
}