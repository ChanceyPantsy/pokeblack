#include "unk_02014CB8.h"

void FUN_02014CB8(void *arg0, void *arg1) {
    if (*(void **)arg0 == 0) {
        *(void **)((u8 *)arg0 + 4) = arg1;
        *(void **)arg0 = FUN_020490F4(arg1, (u16)*(u32 *)((u8 *)arg0 + 0x40));
    }
}
