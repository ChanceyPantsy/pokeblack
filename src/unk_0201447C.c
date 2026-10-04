#include "unk_0201447C.h"

u8 FUN_0201447C(void *obj, u8 value) {
    u8 old = ((u8 *)obj)[17];

    ((u8 *)obj)[17] = value;
    return old;
}