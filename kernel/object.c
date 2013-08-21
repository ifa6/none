#include    <object.h>
#include    "kernel.h"

Object *object_table[MAX_OBJECT];     /*! 对象指示 !*/

void dorun(Object *this){
    /*! 如果存在这个方法,则调用这个方法,并且由这个方法答复 !*/
    if(!isNullp(this->fns[this->fn])) (this->fns[this->fn])(this);
    /*! 否则,告诉他,出错了, !*/
    else ret(this->admit,ERROR);
}
