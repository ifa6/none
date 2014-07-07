#include    <stdio.h>

int main(void){
    for(unsigned short i = 0;i < 16;i++){
        for(int j = 0;j < 16;j++){
            if(i + (j << 4) != '\n'){
                printf("%c  ",i + (j << 4));
            }else{
                printf("\ern\ew  ");
            }
        }
        printf("\n");
    }
    return 0;
}
