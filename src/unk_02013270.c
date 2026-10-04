#include "unk_02013270.h"
#include "heap.h"

void FUN_02045808(void *arg1);

void FUN_02013270(UNK_02013270 *arg1) {
    FUN_02045808(arg1->unk_14);
    Heap_Free(arg1);
}