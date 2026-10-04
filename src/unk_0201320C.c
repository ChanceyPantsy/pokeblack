#include "unk_0201320C.h"

void FUN_0201320C(void *obj) {
    *(u32 *)obj = 9;
    *(u32 *)((u8 *)obj + 4) = 0;
    *(u8 *)((u8 *)obj + 8) = 0;
    *(u16 *)((u8 *)obj + 0xa) = 0;
    *(u8 *)((u8 *)obj + 0xc) = 0;
    *(u8 *)((u8 *)obj + 0xd) = 0;
    *(u8 *)((u8 *)obj + 9) = 0;
}