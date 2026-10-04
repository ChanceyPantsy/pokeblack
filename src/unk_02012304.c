#include "unk_02012304.h"

typedef void (*FUN_02012304_fn)(void *, void *, void *);

void FUN_02012304(void *obj) {
    FUN_02012304_fn method = *(FUN_02012304_fn *)((u8 *)obj + 4);
    method(obj, (u8 *)obj + 8, *(void **)((u8 *)obj + 0xC));
}