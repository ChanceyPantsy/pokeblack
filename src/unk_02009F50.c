#include "unk_02009F50.h"
#include "unk_02009F0C.h"
#include "unk_0200A400.h"
#include "unk_0200A43C.h"

u32 FUN_02009F50(void *obj, u32 arg2) {
    u32 entry = FUN_0200A43C(obj, arg2);
    u32 flag;

    FUN_0200A400(obj);
    if (arg2 < 0xC) {
        flag = FUN_02009F0C(*(u8 *)((u8 *)entry + 0xB3));
        if (flag != 0) {
            return 1;
        }
    }
    return 0;
}