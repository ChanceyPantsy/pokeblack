#include "thunk_FUN_02008216.h"
#include "unk_020071CC.h"

void *thunk_FUN_02008216(void *obj, s32 index) {
    return (u8 *)FUN_020071CC(obj, 0x1b) + 0x44 + index * 4;
}