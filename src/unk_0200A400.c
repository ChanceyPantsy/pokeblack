#include "unk_0200A400.h"

u32 FUN_0200A400(void *arg1) {
    u32 val = *(u32 *)((u8 *)arg1 + 4);

    switch (val) {
    case 0:
        return 3;
    case 1:
        return 0xc;
    }
    return 0;
}