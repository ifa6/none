#include <elf.h>
#include <sys/inter.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#define eprint printf
#include <z.h>

int exec(const char *path,int argc,char **argv){
    int _v = -1;
    object_t o = try(-1 == ,open(path,0),throw e_fail);
    count_t count = argc > 32 ? 32 : argc;
    char *ptr;
    struct {
        char *argv[32];
        char env[0];
    } *buff = _push(NULL,0);
    ptr = buff->env;
    foreach(i,0,count){
        buff->argv[i] = ptr;
        strcpy(ptr,argv[i]);
        ptr += strlen(ptr) + 1;
    }
    _v = run(MM_PID,EXEC,.lng = o,.ptr = buff,.count = argc);
    _pop(buff);
    catch(e_fail){
        return _v;
    }
}
