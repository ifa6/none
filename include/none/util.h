#ifndef __NONE_UTIL_H__
#define __NONE_UTIL_H__
#include <none/types.h>

#define DIV_ROUND_UP(n,d)   (((n) + (d) -1) / (d))
#define MIN(a,b)    (((a) < (b)) ? (a) : (b))
#define MAX(a,b)    (((a) > (b)) ? (a) : (b))
static inline unsigned long  hweight8(u8 w) {
    return (
            (!!((w) & (1ULL << 0))) +
            (!!((w) & (1ULL << 1))) +
            (!!((w) & (1ULL << 2))) +
            (!!((w) & (1ULL << 3))) +
            (!!((w) & (1ULL << 4))) +
            (!!((w) & (1ULL << 5))) +
            (!!((w) & (1ULL << 6))) +
            (!!((w) & (1ULL << 7))));
}

static inline unsigned long hweight16(u16 w) {
    return hweight8(w) + hweight8(w >> 8);
}

static inline unsigned long hweight32(u32 w) {
    return hweight16(w) + hweight16(w >> 16);
}

static inline unsigned long hweight64(u64 w) {
    return hweight32(w) + hweight32(w >> 32);
}

#endif
