#include    <stdio.h>
#include    <stdlib.h>
#include    <object.h>
#include    <sys/inter.h>


static char buff[512];
int main(void){
    char *msg = buff;
    char ch;
    printf("\ey$ \ew");
    do{
        ch = getchar();
        if(ch == '\n'){
            *msg = '\0';
            if(msg != buff){
                ObjectDesc o = open(buff,0);
                if(o != ERROR){
                    run(o,RUN,0,0,0);
                    run(MM_PID,15,0,0,0);
                }else{
                    printf("%s : File not found.\n",msg);
                }
            }
            msg = buff;
            printf("\ey$ \ew");
        }else{
            *msg++ = ch;
        }
    }while(ch != 'q');
    run(MM_PID,CLOSE,0,0,0);
    return 0;
}
