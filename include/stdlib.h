#ifndef __STDLIB_H__
#define __STDLIB_H__
#include    <none/types.h>

/*
//extern void exit(int);
extern void exit() __attribute__((noreturn));
extern pid_t fork(void);
*/

extern pid_t fork(void);
extern int   open(String,int);
extern int   read(int,void*,int);
extern int   write(int,void*,int);
extern void  close(object_t);
extern void  *malloc(size_t );
extern void  free(void *);
extern off_t lseek(object_t ,off_t ,int);
extern int   exec(const char *path,int argc,char **argv);
extern _Noreturn void exit(int v);

#endif
