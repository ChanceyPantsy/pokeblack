#include "unk_020087A8.h"
#include "unk_020071CC.h"

void FUN_020087A8(void *obj, s32 index) {
    *(u16 *)((u8 *)FUN_020071CC(obj, 0x1b) + index * 2 + 0x30) = 0xC21E;
}