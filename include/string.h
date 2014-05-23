#ifndef STRING_H
#define STRING_H
#include    <stddef.h>

static inline void *memcpy(void *dest,const void *src,int n){
    __asm__("cld\n\t"
            "rep\n\t"
            "movsb\n\t"
            :
            :"c"(n),"S"(src),"D"(dest)
            :
           );
    return dest;
}

static inline void *memset(void *dest,int ch,int n){
    __asm__("0:movb  %%al,(%1)\n\t"
            "inc %1\n\t"
            "loop 0b\n\t"
            :
            :"a"(ch),"D"(dest),"c"(n)
            :);
    return dest;
}

static inline char *strcpy(char *dest,const char *src){
    __asm__("0:lodsb\n\t\t"
            "stosb\n\t\t"
            "test %%al,%%al\n\t\t"
            "jne 0b\n\t\t"
            :
            :"D"(dest),"S"(src)
            :);
    return dest;
}

static inline size_t strlen(const char *str){
    size_t  len = 0;
    while(*str++) len++;
    return len;
}

static inline int strncmp(const char *s1,const char *s2,size_t len){
    int same;
    __asm__("cld\n\t\t"
            "rep;cmpsb\n\t"
            "setnz %%al\n\t"
            :"=a" (same)
            :"a"(0),"S"(s1),"D"(s2),"c"(len)
           );
    return same;
}

static inline int strcmp(const char *s1,const char *s2){
    while((*s1 == *s2) && *s1){
        s1++;
        s2++;
    }
    return *s1 - *s2;
}
static inline int memcmp(const void *s1,const void *s2,size_t len){
    int same;
    __asm__("cld\n\t\t"
            "rep;cmpsb\n\t"
            "setnz %%al\n\t"
            :"=a" (same)
            :"a"(0),"S"(s1),"D"(s2),"c"(len)
           );
    return same;
}
#endif
