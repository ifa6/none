#ifndef __X86_BITOPS_H__
#define __X86_BITOPS_H__

#include <none/types.h>

#define BITOP_ADDR(x)       "=m" (*(volatile long *) (x))
#define ADDR                BITOP_ADDR(addr)
#define IS_IMMEDIATE(nr)    (__builtin_constant_p(nr))
#define CONST_MASK_ADDR(nr,addr)    BITOP_ADDR((void *)(addr) + ((nr) >> 3))
#define CONST_MASK(nr)      (1 << ((nr) & 7))

#define LOCK_PREFIX ""

static inline void set_bit(long nr,volatile unsigned long *addr) {
    if(IS_IMMEDIATE(nr)) {
        __asm__ __volatile__ (LOCK_PREFIX "orb %1,%0"
                : CONST_MASK_ADDR(nr,addr)
                : "iq" ((u8)CONST_MASK(nr))
                : "memory");
    } else {
        __asm__ __volatile__ (LOCK_PREFIX "bts %1,%0"
                : BITOP_ADDR(addr) : "Ir" (nr) : "memory");
    }
}

static inline void __set_bit(long nr,volatile unsigned long *addr) {
    __asm__ __volatile__("bts %1,%0" : ADDR :"Ir" (nr) : "memory");
}

static inline void clear_bit(long nr,volatile unsigned long *addr) {
    if(IS_IMMEDIATE(nr)){
        __asm__ __volatile__ (LOCK_PREFIX "andb %1,%0"
                : CONST_MASK_ADDR(nr,addr)
                : "iq" ((u8)~CONST_MASK(nr)));
    }else {
        __asm__ __volatile__(LOCK_PREFIX "btr %1,%0"
                : BITOP_ADDR(addr)
                : "Ir" (nr));
    }
}

static inline void barrier(void) {
    __asm__ __volatile__("":::"memory");
}

static inline void clear_bit_unlock(long nr,volatile unsigned long *addr) {
    barrier();
    clear_bit(nr,addr);
}

static inline void __clear_bit(long nr,volatile unsigned long *addr) {
    __asm__ __volatile__("btr %1,%0" : ADDR : "Ir" (nr));
}

static inline void __clear_bit_unlock(long nr,volatile unsigned long *addr) {
    barrier();
    __clear_bit(nr,addr);
}

static inline void __change_bit(long nr,volatile unsigned long *addr) {
    __asm__ __volatile__("btc %1,%0" : ADDR : "Ir" (nr));
}

static inline void change_bit(long nr,volatile unsigned long *addr) {
    if(IS_IMMEDIATE(nr)) {
        __asm__ __volatile__(LOCK_PREFIX "xorb %1,%0"
                : CONST_MASK_ADDR(nr,addr)
                : "iq" ((u8)CONST_MASK(nr)));
    } else {
        __asm__ __volatile__(LOCK_PREFIX "btc %1,%0"
                : BITOP_ADDR(addr)
                : "Ir" (nr));
    }
}

#define BITS_PER_LONG   (sizeof(long) * 8)

static inline unsigned long ffz(unsigned long word) {
    __asm__ ("rep;bsf %1,%0"
            : "=r" (word)
            : "r" (~word));
    return word;
}

static inline unsigned long find_first_zero_bit(const unsigned long *addr,unsigned long size) {
    const unsigned long *p = addr;
    unsigned long result = 0;
    unsigned long tmp;

    while (size & ~(BITS_PER_LONG-1)) {
        if (~(tmp = *(p++)))
            goto found;
        result += BITS_PER_LONG;
        size -= BITS_PER_LONG;
    }
    if (!size)
        return result;

    tmp = (*p) | (~0UL << size);
    if (tmp == ~0UL)    /* Are any bits zero? */
        return result + size;   /* Nope. */
found:
    return result + ffz(tmp);

}

static inline int __test_and_clear_bit(long nr,volatile unsigned long *addr) {
    int oldbit;
    __asm__ volatile("btr %2,%1\n\t"
            "sbb %0,%0"
            : "=r" (oldbit),ADDR
            : "Ir" (nr));
    return oldbit;
}

static inline int __test_and_change_bit(long nr,volatile unsigned long *addr){
    int oldbit;
    __asm__ __volatile__("btc %2,%1\n\t"
            "sbb %0,%0"
            : "=r" (oldbit),ADDR
            : "Ir" (nr) : "memory");
    return oldbit;
}

static inline int __test_and_set_bit(long nr,volatile unsigned long *addr) {
    int oldbit;

    __asm__("bts %2,%1\n\t"
            "sbb %0,%0"
            : "=r" (oldbit),ADDR
            : "Ir" (nr));
    return  oldbit;
}


#endif
