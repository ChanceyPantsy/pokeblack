#include "unk_02013144.h"

void FUN_02013144(void *obj, u32 value) {
    *(u16 *)((u8 *)obj + 0x82) |= (u16)value;
}