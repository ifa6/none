#include <stdio.h>
#include <stdlib.h>
#define delay(x) for(unsigned int i = 0;i < x * 0x10;i++) for(unsigned int j = 0;j < 0xeff;j++)
int main(int argc,char **argv){
    //object_t o;
    printf("Enter test.\n");
    for(int i = 0;i < argc;i++){
        printf("argv[%d] = %s\n",i,argv[i]);
    }
    printf("Leval test.\n");
#if 0
    o = fork();
    if(o > 0){
        while(1) {
            delay(100);
            printf("F");
        }
    } else if(o == 0){
        while(1) {
            delay(100);
            printf("C");
        }
    } else {
        printf("Error\n");
    }
#endif
    exit(0);
}
