#include "unk_0200d48c.h"
#include "mi_memory.h"

void FUN_0200d48c(void *arg0) {
    MI_CpuFill8(arg0, 0, 0x14);
    *(u16 *)arg0 = 0xFFFF;
}