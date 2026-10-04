#include "unk_02015BA4.h"

void FUN_02016BA0(void *arg0);
void FUN_02016C0C(void *arg0);
void FUN_02016C38(void *arg0);
void Heap_Free(void *ptr);

struct UNK_02015BA4_1 {
    u8 unk_00[0x14];
    void **unk_14;
};

struct UNK_02015BA4_2 {
    void *unk_00;
    void *unk_04;
    void *unk_08;
    u8 unk_0C[0x13C];
    u32 unk_148;
};

void FUN_02015BA4(struct UNK_02015BA4_1 *arg0, struct UNK_02015BA4_2 *arg1) {
    FUN_02016BA0(arg1);

    if (arg1->unk_00 != NULL) {
        FUN_02016C0C(arg1->unk_00);
        arg1->unk_00 = NULL;
    }

    if (arg1->unk_04 != NULL) {
        FUN_02016C38(arg1->unk_04);
        arg1->unk_04 = NULL;
    }

    if (arg1->unk_08 != NULL) {
        FUN_02016C38(arg1->unk_08);
        arg1->unk_08 = NULL;
    }

    arg0->unk_14[arg1->unk_148] = NULL;
    Heap_Free(arg1);
}