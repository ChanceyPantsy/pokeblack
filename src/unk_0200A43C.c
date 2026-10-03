#include "unk_0200A43C.h"
#include "unk_0200A400.h"
#include "unk_0200A418.h"

u32 FUN_0200A43C(void *obj, u32 index) {
    u32 base;
    u32 kind;

    FUN_0200A400(obj);
    kind = *(u32 *)((u8 *)obj + 4);
    switch (kind) {
    case 0:
        base = FUN_0200A418(obj) + 0x100;
        return base + 0xCC * index;
    case 1:
        base = FUN_0200A418(obj) + 0x100;
        return base + 0xCC * index;
    }
    return 0;
}