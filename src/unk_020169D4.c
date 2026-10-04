#include "unk_020169D4.h"

void FUN_020169D4(void)
{
    *(volatile u32 *)0x040004C0 = 0x4210FFFF;
    *(volatile u32 *)0x040004C4 = 0x4210FFFF >> 16;
}
