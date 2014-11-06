#include <stdio.h>
int main(int argc,char **argv){
    printf("Enter test.\n");
    for(int i = 0;i < argc;i++){
        printf("argv[%d] = %s\n",i,argv[i]);
    }
    printf("Leval test.\n");
}
