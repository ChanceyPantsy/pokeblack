#include "unk_0200b424.h"

#include "heap.h"

void FUN_0200b424(void) {
    void **slot = (void **)0x0214616C;

    Heap_Free(*slot);
    *slot = NULL;
}