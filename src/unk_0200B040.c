#include "unk_0200B040.h"

#include "mi_memory.h"
#include "unk_0200AE54.h"

void FUN_0200B040(void *obj, void *dest) {
    MI_CpuFill8(dest, 0, 8);

    *(u8 *)((u8 *)dest + 7) = FUN_0200AE54(obj, 0xD);

    if (*(volatile u8 *)((u8 *)dest + 7) >= 2) {
        *(u8 *)((u8 *)dest + 7) = 1;
    }

    MI_CpuCopy8((u8 *)obj + 0xAC, dest, 7);
}