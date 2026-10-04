#include "unk_02013220.h"

void FUN_02013220(void *obj) {
    *(u32 *)obj = 0;
    *(u32 *)((u8 *)obj + 4) = 0;
    *(u8 *)((u8 *)obj + 9) = 0;
    *(u8 *)((u8 *)obj + 8) = 0;
    *(u16 *)((u8 *)obj + 0xa) = 0;
    *(u8 *)((u8 *)obj + 0xc) = 0xa;
    *(u8 *)((u8 *)obj + 0xd) = 0;
}