#include <elf.h>
#include <sys/inter.h>
#include <stdio.h>
#include <stdlib.h>
#define BLOCK_SIZE 1024

static char buff[BLOCK_SIZE];
int exec(const char *path,int argc,char **argv){
    object_t o = open(path,0);
    static Elf32_Ehdr ehdr;
    Elf32_Shdr *shdr;
    int (*fn)(int argc,char **argv);
    /*! read ehdr !*/
    read(o,&ehdr,sizeof(ehdr));
    fn = (void*)ehdr.e_entry;
    printf("entry : %d\n",ehdr.e_entry);
    printf("e_shoff : %d\n",ehdr.e_shoff);
    /*! read shdr !*/
    lseek(o,ehdr.e_shoff,SEEK_SET);
    read(o,buff,ehdr.e_shentsize * ehdr.e_shnum);
    shdr = (void*)buff; 
    foreach(i,0,ehdr.e_shnum){
        if((shdr->sh_type == SHT_PROGBITS) && (shdr->sh_flags & SHF_ALLOC)){
            lseek(o,shdr->sh_offset,SEEK_SET);
            read(o,(void*)shdr->sh_addr,shdr->sh_size);
        }
        shdr++;
    }
    printf("hello\n");
    exit(fn(argc,argv));
}
