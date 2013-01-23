#ifndef __STDLIB_H__
#define __STDLIB_H__
//#include    <types.h>

/*
//extern void exit(int);
extern void exit() __attribute__((noreturn));
extern pid_t fork(void);
*/

#define free(p) free_s(p,0)

extern void *malloc(unsigned int);
extern void free_s(void *,int );

#endif
