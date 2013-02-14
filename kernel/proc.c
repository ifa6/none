#include    "kernel.h"
#include    "i8259.h"

#define istaskp(p)  ((p)->pri == PRI_TASK)
#define isservep(p) ((p)->pri == PRI_SERVER)
#define isuserp(p)  ((p)->pri == PRI_USER)
#define isnull(p)   ((p) == NULL)

Proc *task[NR_TASKS];
Proc *act_proc;
Proc *proc_ptr;

Proc *rdy_head[NR_PRI];
Proc *rdy_tail[NR_PRI];

Tss *tss;

static int isrecv(pid_t wait,pid_t wakeup){
    if(wait == ANY) return 1;
    return (wait == wakeup); 
} 

#define ishardware(dest)    isrecv((dest),HARDWARE)

void pick_proc(void){
    //Proc *rp;
    for(int i  = 0;i < NR_PRI;i++){
        if(NULL != rdy_head[i]){
            proc_ptr = rdy_head[i];
            return;
        }
    }
    proc_ptr = proc_addr(IDLE);
}

void ready(Proc *rp){
    if(isnull(rp)) panic("\erReady    \eb[\erprocess is <null>\eb]");
    if(isnull(rdy_head[rp->pri]))
        rdy_head[rp->pri] = rp;
    else
        rdy_tail[rp->pri]->next = rp;
    rp->next = NULL;
    rdy_tail[rp->pri] = rp;
    pick_proc();
}

void unready(Proc *rp){
    Proc *xp;
    if(isnull(rp)) panic("\erUnready    \eb[\erprocess is <null>\eb]");
    if(NULL == (xp = rdy_head[rp->pri])) return;
    if(xp == rp){
        rdy_head[rp->pri] = rp->next;
        /*
           if(rdy_tail[rp->pri] == rp)
           rdy_tail[rp->pri] = NULL;
           */
    }else{
        while(xp->next != rp) 
            if(NULL == (xp = xp->next)) return;
        xp->next = xp->next->next;
        if(rdy_tail[rp->pri] == rp)
            rdy_tail[rp->pri] = xp;
    }
    if(proc_ptr == rp) pick_proc();
    hlt();
    //while(act_proc == rp);
}

int proc_send(pid_t dest,Message *m_ptr){
    Proc *rp,*sp;
    sp = act_proc;
    m_ptr->src = proc_number(sp);
    if((rp = proc_addr(dest)) == NULL) return -1;
    if((rp->flags & RECVIEING) && (isrecv(rp->getfrom,m_ptr->src))){
        memcpy(&(rp->message),m_ptr,sizeof(Message));
        rp->wait = m_ptr->src;
        rp->flags &= ~(RECVIEING);
        ready(rp);
        unready(sp);
        return 0;
    }

    Proc **sl;
    sl = &(rp->sendlink);
    sp->sendnext = NULL;
    memcpy(&(sp->message),m_ptr,sizeof(Message));
    while(*sl != NULL) sl = &((*sl)->sendnext);
    *sl = sp;
    sp->flags |= SENDING;
    unready(sp);
    return 0;
}

int interrupt(pid_t dest,Message *m_ptr){
    Proc *rp;
    Interrput *inte;
    m_ptr->src = HARDWARE;
    if(NULL == (rp = proc_addr(dest))) panic("\erInterrupt    \eb[\ersystem tasks don't found\eb]");
    if((rp->flags & RECVIEING) && (ishardware(rp->getfrom))){
        memcpy(&(rp->message),m_ptr,sizeof(Message));
        rp->wait = HARDWARE;
        rp->flags &= ~(RECVIEING);
        ready(rp);
        return 0;
    } 
    if(NULL == (inte = malloc(sizeof(Interrput)))) panic("\erInterrput    \eb[\ermemory is out\eb]");
    memcpy(&(inte->message),m_ptr,sizeof(Message));
    inte->next = rp->interruptlink;
    rp->interruptlink = inte;
    return 0;
}

int proc_receive(pid_t src,Message *m_ptr){
    Proc *rp,*sp,**sl;
    Interrput *inte;
    rp = act_proc;
    sp = rp->sendlink;
    sl = &((rp)->sendlink);
    if((ishardware(src)) && (inte = rp->interruptlink)){
        rp->interruptlink = inte->next;
        memcpy(m_ptr,&(inte->message),sizeof(Message));
        free(inte);
        return 0;
    }else { 
        while(sp != NULL){
            if(isrecv(src,proc_number(sp))){
                if((sp->flags & SENDING)){
                    //*sp = np->sendlink;
                    memcpy(m_ptr,&(sp->message),sizeof(Message));
                    sp->flags &= ~(SENDING);
                    *sl = sp->sendnext;
                    ready(sp);
                    return 0;
                }
            }
            sl = &(sp->sendnext);
            sp = sp->sendnext;
        }
    }
    rp->flags |= RECVIEING;
    rp->getfrom = src;
    unready(rp);
    memcpy(m_ptr,&(rp->message),sizeof(Message));
    if(rp->wait != HARDWARE)  ready(proc_addr(rp->wait));
    return 0;
}

void sched(void){
    if(rdy_head[PRI_USER] == NULL)return;

    rdy_tail[PRI_USER]->next = rdy_head[PRI_USER];
    rdy_tail[PRI_USER] = rdy_head[PRI_USER];
    rdy_head[PRI_USER] = rdy_head[PRI_USER]->next;
    rdy_tail[PRI_USER]->next = NULL;
    pick_proc();
}


Proc *make_proc(pid_t pid,const char *pname,Pointer data,Pointer code,int pri,int (*pentry)()){
    Proc    *p;
    p = (Proc*)get_free_page();
    p->pid = pid;
    p->pri = pri;
    p->core = getcr3();
    p->esp0 = (Pointer)p + sizeof(Task);
    strcpy(p->pname,pname);
    p->sendnext = p->sendlink = NULL;
    p->registers = (Registers*)(p->esp0 - 0x100);
    p->interruptlink = NULL;
    memcpy(p->registers,&(Registers){
            .gs = data,
            .fs = data,
            .ds = data,
            .es = data,
            .edi = 0,
            .esi = 0,
            .ebp = 0,
            .ebx = 0,
            .edx = 0,
            .ecx = 0,
            .eax = 0,
            .eip = (long)(pentry),
            .cs = code,
            .eflags = 0x200,
            },sizeof(Registers));
    task[pid] = p;
    ready(p);
    return p;
}

void proc_init(){
    Pointer tr = TR_DESC;
    Proc *idle;

    for(int i = 0;i < NR_PRI;i++){
        rdy_head[i] = rdy_tail[i] = NULL;
    }
    idle = (Proc *)get_free_page();
    idle->pid = IDLE;
    idle->core = getcr3();
    idle->esp0 = (Pointer)(idle) + sizeof(Task);
    strcpy(idle->pname,"idle");
    idle->sendlink = NULL;
    idle->interruptlink = NULL;
    act_proc = idle;
    task[IDLE] = idle;

    make_proc(CLOCK_PID,"CLock",KERNEL_DATA,KERNEL_CODE,PRI_TASK,clock_main);
    extern int system_main();
    make_proc(SYSTEM_PID,"Sytem",KERNEL_DATA,KERNEL_CODE,PRI_TASK,system_main);
    extern int at_main();
    make_proc(AT_PID,"HardWare",KERNEL_DATA,KERNEL_CODE,PRI_TASK,at_main);
    extern int fs_main();
    make_proc(FS_PID,"FS",KERNEL_DATA,KERNEL_CODE,PRI_TASK,fs_main);


    tss = (Tss*)(TSS_TABLE);
    tss->ss0 = KERNEL_DATA;
    tss->esp0 = idle->esp0;
    //tss->gs = tss->fs = tss->es = tss->ds = USER_DATE;
    tss->ldt = 0;
    tss->io = 0xffff0000;
    tss->eflags = 0x200;
    asm("ltr %0"::"m"(tr));
    pick_proc();
}
