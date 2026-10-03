#ifndef FUN_02082AC0_H
#define FUN_02082AC0_H

#include "types.h"

// The SDK memset, under the address it is known by in this disassembly.
// Note the parameter order: the fill byte comes first, then the destination.
void FUN_02082AC0(u8 data, void *dest, u32 size);

#endif