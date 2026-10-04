#ifndef FUN_02013270_H
#define FUN_02013270_H

#include "types.h"

typedef struct {
    u8 data[0x14];
    void *unk_14;
} UNK_02013270;

void FUN_02013270(UNK_02013270 *arg1);

#endif