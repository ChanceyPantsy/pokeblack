#include "unk_02014CD4.h"

void FUN_02014CD4(void *arg0) {
    if (*(void **)arg0 != 0) {
        FUN_02049238(*(void **)arg0);
        *(void **)((u8 *)arg0 + 4) = 0;
        *(void **)arg0 = 0;
    }
}
