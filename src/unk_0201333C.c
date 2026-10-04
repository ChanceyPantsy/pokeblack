#include "unk_0201333C.h"

void FUN_020127A4(void *arg1);
void *FUN_0201A920(void *arg1);
void *FUN_02012934(void *arg1);
void FUN_0201AC2C(void *arg1, void *arg2);

void FUN_0201333C(UNK_0201333C *arg1, void *arg2, void *arg3) {
    void *ret;

    FUN_020127A4(arg2);
    arg1->unk_24 = FUN_0201A920(arg3);
    ret = FUN_02012934(arg2);
    FUN_0201AC2C(ret, arg1->unk_24);
}