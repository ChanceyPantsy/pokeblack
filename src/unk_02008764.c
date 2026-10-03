#include "unk_02008764.h"
#include "unk_020071CC.h"

void FUN_02008764(void *obj) {
    *(u8 *)((u8 *)FUN_020071CC(obj, 0x1b) + 0x2c) = 1;
}