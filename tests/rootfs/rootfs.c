#include <dirent.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>
#include <stdio.h>

/*!  import by none !*/
#define  eprint(fmt,...)   fprintf(stderr,fmt,##__VA_ARGS__)
#include <string.h>
#include "z.h"
#include "rootfs.h"
#include "sha1.h"

#define DIGIT_STRING    "0123456789abcdef"
#define TEST_AND_FREE(fn,x,v)   do{if(x == v){fn(x);} x = v;}while(0)

#define container_of(ptr,type,member) ({\
        const __auto_type _mptr = (ptr); \
        (type *)((char *)_mptr - offsetof(type,member));})

static struct hlist_head  dir[256] = {{NULL}};

static void sha1ToString(char *str,const uint8_t *sha1){
    if(!str || !sha1) return;
    for(var i = 0;i < 20;i++){
        str[i * 2]  = DIGIT_STRING[(sha1[i] >> 4) & 0xf];
        str[i * 2 + 1]     = DIGIT_STRING[sha1[i] & 0xf];
    }
    str[40] = 0;
}

static void calcSHA1(void *sha1,void *data,size_t len){
    SHA1_CONTEXT hd;
    sha1_init(&hd);
    sha1_write(&hd,data,len);
    sha1_final(&hd);
    memcpy(sha1,hd.buf,20);
}

static void RFSHA1(RFS *rfs){
    calcSHA1(rfs->sha1,rfs->blob,rfs->size);
}

static void RFSName(char *name,RFS *rfs){
    sha1ToString(name,rfs->sha1);
}


RFS* newRFS(void *data,RFSType type ,size_t len){
    RFS *rfs;
    if(and(!,data,len)) return NULL;
    rfs = try(NULL == ,malloc(sizeof(rfs[0]) + len),return NULL);
    rfs->size = len;
    rfs->type = type;
    INIT_HLIST_NODE(&(rfs->hlist));
    memcpy(rfs->blob,data,len);
    RFSHA1(rfs);
    hlist_add_head(&(rfs->hlist),&(dir[rfs->sha1[0]]));
    return rfs;
}

#define CALCRFS(x)  (sizeof(x[0]) + x->size)

RFS *newRFSTree(RFS *old,const RFS *new,const char *name){
    RFSTree *tree;
    if(or(!,name,new)) return NULL;

    size_t size = 0;
    if(old){
        if(old->type != RFS_TREE) return NULL;
        size = old->size;
        tree = malloc(size + sizeof(RFSTree));
        memcpy(tree,old->blob,size);
    }else{
        tree = malloc(sizeof(RFSTree));
    }
    int index = size / sizeof(RFSTree);
    size_t nLen = strlen(name);

    memcpy(tree[index].sha1,new->sha1,20);
    memcpy(tree[index].name,name,nLen > RFS_NAME_LENGTH ? RFS_NAME_LENGTH : nLen);
           tree[index].type = new->type;
    return newRFS(tree,RFS_TREE,size + sizeof(RFSTree));
}

int main(int argc,char **argv){
    int fd = -1;
    off_t len = -1;
    void *buffer = NULL;
    if(argc < 2) return -1;
    RFS *rfs = NULL;
    for(var i = 1;i < argc;i++){
        RFS *new;
        fd = try(-1 == ,open(argv[i],O_RDONLY),{
            perror(argv[i]);
            throw e_fial;
        });
        len = try(-1 == ,lseek(fd,0,SEEK_END),{
            perror(argv[i]);
            throw e_fial;
        });
        lseek(fd,0,SEEK_SET);
        buffer = try(NULL == ,malloc(len),{
            perror(argv[i]);
            throw e_fial;
        });
        len = read(fd,buffer,len);
        new = newRFS(buffer,RFS_BLOB,len);
        rfs = newRFSTree(rfs,new,argv[i]);
        catch(e_fial){
            TEST_AND_FREE(free,buffer,NULL);
            TEST_AND_FREE(close,fd,-1);
            continue;
        }
    }

    for(var i = 0;i < 256;i++){
        char sha1[41];
        struct hlist_node *r;
        hlist_for_each(r,&dir[i]){
            rfs = hlist_entry(r,RFS,hlist);
            sha1ToString(sha1,rfs->sha1);
            printf("%s %s %2x\n",((char *[]){"BLOB","TREE"})[rfs->type],sha1,i);
            if(rfs->type == RFS_TREE){
                for(var j = 0;rfs && j < rfs->size / sizeof(RFSTree);j++){
                    char sha1[41];
                    sha1ToString(sha1,rfs->tree[j].sha1);
                    printf("  %s %s %s ","|-",((char *[]){"BLOB","TREE"})[rfs->tree[j].type],sha1);
                    for(var k = 0;k < RFS_NAME_LENGTH;k++)
                        putchar(rfs->tree[j].name[k]);
                    putchar('\n');
                }
            }
        }
    }
    return 0;
}
