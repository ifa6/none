#include <stdio.h>
#include <z.h>
int main(int argc,char **argv){
    //printf("argc = %08x argv = %08x\n",argc,argv);
    foreach(i,1,argc){
        printf("%s ",argv[i]);
    }
    printf("\n");
    return 0;
}
