#include    <object.h>
#include    "kernel.h"

Object *object_table[MAX_OBJECT];     /*! 对象指示 !*/

static ObjectDesc getFreeObject(void){
    for(int i = 0;i < MAX_OBJECT;i++){
        if(object_table[i] == NULL) return i;
    }
    return 0;
}

void dorun(Object *this){
    /*! 如果存在这个方法,则调用这个方法,并且由这个方法答复 !*/
    if(!isNullp(this->fns[this->fn])) (this->fns[this->fn])(this);
    /*! 否则,告诉他,出错了, !*/
    else ret(this->admit,ERROR);
}

Object *cloneObject(Object *obj){
    ObjectDesc od = getFreeObject();
    if(!isE(0,od)){
        Object *o = OBJECT(get_free_page());
        if(!isNullp(o)){
            memcpy(o,obj,PAGE_SIZE);
            object_table[od] = o;
            o->id = od;
            return o;
        }
    }
    return NULL;
}

/*! 由文件名返回一个对象 !*/
ObjectDesc byName(String name){
    return run(FS_PID,OPEN,0,0,name);
}

/*! 由ID返回一个对象 !*/
ObjectDesc byId(id_t id){
    return 0;
}
