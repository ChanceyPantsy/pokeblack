#include "unk_02013270.h"
#include "unk_02045808.h"
#include "heap.h"

void FUN_02013270(void *obj) {
    FUN_02045808(*(void **)((u8 *)obj + 0x14));
    Heap_Free(obj);
}
