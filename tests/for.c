
#include <z.h>
#include <stdio.h>
int main(void){
    foreach(i,1,20){
        printf("%d %d\n",i,sizeof(640));
        foreach(j,1,10){
            printf("%d %d\n",j,sizeof(640));
        }
    }
    return 0;
}
