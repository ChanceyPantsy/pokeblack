#include "unk_02016984.h"
#include "heap.h"

u32 FUN_020648B4(void *ptr);
void FUN_02064754(void *arg0, void *arg1, void *arg2, void *arg3, void *arg4, void *arg5);

struct UNK_FUN_02016984 {
    u8 unk_00[0x10];
    void *unk_10;
    u8 unk_14[4];
    void *unk_18;
    u8 unk_1C[4];
    void *unk_20;
    u8 unk_24[0x74];
    void *unk_98;
    u8 unk_9C[0xB0];
    u32 unk_14C;
};

void FUN_02016984(void *arg0, void *arg1) {
    struct UNK_FUN_02016984 *self = arg0;
    void *size = (void *)FUN_020648B4(self->unk_18);

    self->unk_98 = Heap_AllocDebug((enum HeapID)(u16)self->unk_14C, (u32)size, FALSE, (const char *)0x020A72CC, 0x970);
    FUN_02064754(&self->unk_24[0x10], self->unk_98, self->unk_20, self->unk_10, self->unk_18, arg1);
}
