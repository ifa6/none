#include <stdio.h>
#include <stdlib.h>
#include <sys/inter.h>
#include <posix.h>
#include <z.h>

static int _exec(const char *path,int argc,char **argv);
static char *getline(void);
static int parse(char *buffer,char **argv,int len);

static int parse(char *buffer,char **argv,int len){
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

static int _exec(const char *path,int argc,char **argv){
    object_t o;
    if(0 < (o = fork())){
        return 0;
    }else if(o == 0){
        if(argc > 2 && argv[argc - 2][0] == '>'){
            dup2(argv[argc - 1][0] - '0',1);
            argc -= 2;
        }
        return exec(path,argc,argv);
    } else {
        return -1;
    }
}

static char buff[512];
static char *getline(void){
    char ch;
    int i;
    for(i = 0;i < 511;i++){
        ch = getchar();
        if(ch == '\n') break;
        if(ch == '\b' && i){
            buff[--i] = 0;
            continue;
        }
        buff[i] = ch;
    }
    buff[i] = 0;
    return buff;
}

int main(void){
    char *buffer;
    char *argv[10];
    int  argc = 0;
    for(;;){
        printf("\ey$ \ew");
        buffer = getline();
        argc = parse(buffer,argv,10);
        if(argc == 0) continue;
        if(OK != _exec(argv[0],argc,argv))
            printf("%s : No usch file or directory\n",argv[0]);
        else
            run(MM_PID,15,0,0,0);
    }
    run(MM_PID,CLOSE,0,0,0);
    return 0;
}
