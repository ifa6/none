#include    <stdio.h>

int main(void){
    char *msg = "\eyhello,kennel\ew\n\eb$\ew";
    int ch = '$';
    printf(msg);
    do{
        ch = getchar();
        if(ch == '\n'){
            printf("\nsorry,i want sleep!\n\ey:-)\n\ew");
        }else{
        }
    }while(ch != 'q');
    return 0;
}
