#include <elf.h>
#include <sys/inter.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#define BLOCK_SIZE 1024

int exec(const char *path,int argc,char **argv){
    int _v;
    count_t count = argc > 32 ? 32 : argc;
    char *ptr;
    struct {
        char *path;
        char *argv[32];
        char env[0];
    } *buff = _push(NULL,0);
    buff->path = buff->env;
    strcpy(buff->path,path);
    ptr = buff->env + strlen(buff->env) + 1;
    foreach(i,0,count){
        buff->argv[i] = ptr;
        strcpy(ptr,argv[i]);
        ptr += strlen(ptr) + 1;
    }
    _v = run(MM_PID,EXEC,.ptr = buff,.count = argc);
    _pop(buff);
    return _v;
}
