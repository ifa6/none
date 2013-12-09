#include    "kernel.h"

Object *object_table[NR_OBJECT];     /*! 对象指示 !*/

static ObjectDesc getFreeObject(void){
    for(int i = 0;i < NR_OBJECT;i++){
        if(object_table[i] == NULL) return i;
    }
    return 0;
}


Object *cloneObject(Object *obj){
    ObjectDesc od = getFreeObject();
    if(!isE(0,od)){
        Object *o = get_free_page();
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
