#include    "kernel.h"

Object *object_table[NR_OBJECT];     /*! 对象指示 !*/

static object_t getFreeObject(void){
    for(int i = 0;i < NR_OBJECT;i++){
        if(object_table[i] == NULL) return i;
    }
    return 0;
}


Object *cloneObject(Object *obj){
    object_t od = getFreeObject();
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
object_t byName(String name){
    return run(FS_PID,OPEN,.name = name);
}

/*! 由ID返回一个对象 !*/
object_t byId(id_t id){
    (void)id;
    return 0;
}
