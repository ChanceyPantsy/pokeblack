#include "unk_02016394.h"

struct UNK_02016394 {
    u8 unk_00[0x140];
    u32 unk_140;
};

void FUN_02016394(struct UNK_02016394 *arg0, u32 arg1) {
    arg0->unk_140 = (arg0->unk_140 & 0xBFFFFFFF) | ((arg1 << 31) >> 1);
}