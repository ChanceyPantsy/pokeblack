#include "unk_02009D08.h"
#include "unk_020071CC.h"

void FUN_020099D4(void *obj, u32 arg1);

void *FUN_02009D08(void *arg1) {
    void *res = FUN_020071CC(arg1, 0x1e);

    FUN_020099D4(res, 0);
    return res;
}