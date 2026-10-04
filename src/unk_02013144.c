#include "unk_02013144.h"

void FUN_02013144(void *obj, u16 value) {
    *(u16 *)((u8 *)obj + 0x82) |= value;
}