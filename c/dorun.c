#include    <task.h>
#include    <stdio.h>
#include    <sys/inter.h>
void dorun(void){
    Object *this = NULL;
    while(1){
        this = get();
        /*! 如果存在这个方法,则调用这个方法,并且由这个方法答复 !*/
        if((this->fn >= 0) && (this->fn < NR_METHON) && (!isNullp(this->fns[this->fn]))){
            (this->fns[this->fn])(this);
        } else{   /*! 否则,告诉他,出错了, !*/
            ret(this->admit,ERROR);
        }
    }
}
