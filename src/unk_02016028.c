#include "unk_02016028.h"

void *FUN_020627D8(void *arg0, u16 arg1);
void FUN_02016984(void *arg0, u32 arg1);
void FUN_0206469C(void *arg0, void *arg1);
void Heap_Free(void *ptr);

struct UNK_02016028 {
    u8 unk_00[0x28];
    void *unk_28;
    u8 unk_2C[0x08];
    u8 unk_34[0x64];
    void *unk_98;
    u8 unk_9C[0xA8];
    u32 unk_144;
};

void FUN_02016028(struct UNK_02016028 *arg0, u32 arg1) {
    u16 id = (u16)arg1;
    void *ptr = FUN_020627D8(arg0->unk_28, id);

    if (arg0->unk_98 != NULL) {
        Heap_Free(arg0->unk_98);
    }

    FUN_02016984(arg0, 1);
    FUN_0206469C(arg0->unk_34, ptr);
    arg0->unk_144 &= ~(1);
}