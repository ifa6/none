/*******************************************************************************
 *  巫师:
 *      lzy
 *  日辰:
 *      Tue Nov 19 21:18:47 CST 2013
 *  巫术:
 *      探测none内存管理是否准备好迎接malloc
 * *****************************************************************************/

#include    <stdio.h>
int main(void){
    char * m = (void*)0xD00000;
    for(unsigned int i = 0;i < 0xFF200000;i += 0x100000){
        printf("%c",m[i]);
    }
    printf("[RASCA] : |TEST| return \n");
    //while(1);
    return 0;
}
