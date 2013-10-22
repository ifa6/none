#include    <stdio.h>
#include    <string.h>
#include    <sys/inter.h>

#define VGABASE ((void *)0xC0000)
#define VGALIMIT    0x8000
int main(void){
    const char * pm = VGABASE;
    for(int i = 0;i < VGALIMIT;i++){
        if(!strncmp(pm + i,"PMID",4)){
            printf("PMID = %p\n",i + pm);
            printf("%c%c%c%c\n",pm[i],pm[i + 1],pm[i + 2],pm[i + 3]);
        }
    }
    printf("Welcome to none world!\n");
    return 0;
}
