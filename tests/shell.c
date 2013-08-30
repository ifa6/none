#include    <stdio.h>
#include    <sys/inter.h>



int main(void){
    static char buff[128];
    char *msg = buff;
    char ch;
    printf("\ey$ \ew");
    do{
        ch = getchar();
        if(ch == '\n'){
            msg = '\0';
            if(OK == run(FS_PID,READ,0,0,buff)){
                run(MM_PID,15,0,0,0);
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
