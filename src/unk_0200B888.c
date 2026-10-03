#include "unk_0200B888.h"

s32 FUN_0200B888(s32 arg1, u8 *arg2) {
    u8 *ptr = arg2 + 0x80;

    return (*(u16 *)(arg2 + 0x189C) != 0xE281 || *(u16 *)(ptr + 0x28) != 0xE281) ? 1 : 0;
}
