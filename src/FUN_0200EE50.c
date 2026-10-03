#include "FUN_0200EE50.h"
#include "mi_memory.h"

int FUN_0200EE48(void);

void FUN_0200EE50(void *arg1) {
    MI_CpuFill8(arg1, 0, FUN_0200EE48());
}