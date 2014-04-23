#include    <stdio.h>
#include    <stdlib.h>
#include    <object.h>
#include    <sys/inter.h>
#include <z.h>


static int exec(const char *path,int argc,char **argv);
static char *getline(void);
static int parse(char *buffer,char **argv,int len);
int main(void){
    char *buffer;
    char *argv[10];
    int  argc = 0;
    printf("\ey$ \ew");
    for(;;){
        buffer = getline();
        printf("%s",buffer);
        while(1);
        argc = parse(buffer,argv,10);
        if(OK != exec(argv[0],argc,argv))
            printf("%s : No usch file or directory\n",argv[0]);
    }
    run(MM_PID,CLOSE,0,0,0);
    return 0;
}

static int parse(char *buffer,char **argv,int len){
    char *pos = buffer;
    int argc = 0;
    argv[0] = buffer;
    while(*pos){
        switch(*pos){
            case ' ' : 
                *pos = 0;
                while(*(++pos) && *pos != ' ');
                argc++;
                if(argc >= len) return argc;
                argv[argc] = pos;
                break;
        }
    }
    return argc;
}

static int exec(const char *path,int argc,char **argv){
    ObjectDesc o = open(path,0);
    if(o != ERROR){
        run(o,RUN,argc,0,argv);
        run(MM_PID,15,0,0,0);
    }
    return -1;
}

static char buff[512];
static char *getline(void){
    char ch;
    int i;
    for(i = 0;i < 511;i++){
        ch = getchar();
        printf("%c",ch);
        if(ch == '\n') break;
        buff[i] = ch;
    }
    buff[i] = 0;
    printf("%s",buff);
    return buff;
}
