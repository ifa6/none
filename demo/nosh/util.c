#include "util.h"
#include <string.h>
#include <stdio.h>
#include <ctype.h>
void *realloc(void *buffer,size_t size){
    void *new;
    new = malloc(size);
    if(new){
        memcpy(new,buffer,size);
    }
    free(buffer);
    return new;
}

static inline int parse(char *buffer,char **argv,int len){
    char *pos = buffer;
    int argc = 0;
    argv[0] = buffer;
    while(*pos){
        switch(*pos){
            case ' ' : 
                *pos = 0;
                while(*(++pos) && *pos == ' ');
                argc++;
                if(argc >= len) return argc;
                argv[argc] = pos;
                break;
        }
        pos++;
    }
    if(pos != buffer) argc++;
    return argc;
}
int system(char *cmd) {
    pid_t pid;
    char *argv[10];
    int  argc = 0;
    argc = parse(cmd,argv,10);
    if( 0 == (pid = fork())){
        exec(argv[0],argc,argv);
    } else if(pid > 0){
        return 0;
    }
    return 0;
}

int atoi(const char *string) {
    int number = 0;
    while(*string){
        if(*string >= '0' && *string <= '9'){
            number = number * 10 + *string - '0';
        } else {
            break;
        }
        string++;
    }
    return number;
}
