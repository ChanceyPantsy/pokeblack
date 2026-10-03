#include "unk_020095E8.h"

void FUN_020095E8(void *obj) {
    u8 *ptr = (u8 *)obj + 0x345;

    if (*ptr < 0xE9) {
        *ptr = *ptr + 1;
    }
}