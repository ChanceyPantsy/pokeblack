#include "unk_02008784.h"
#include "unk_020071CC.h"

BOOL FUN_02008784(void *obj, s32 index) {
    return *(u16 *)((u8 *)FUN_020071CC(obj, 0x1b) + index * 2 + 0x30) == 0xC21E;
}