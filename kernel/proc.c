#include    "kernel.h"

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

static int isrecv(pid_t src,pid_t dest){
    if(src == ANY) return 1;
    else return (src == dest); 
} 

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
    if((rp->flags & RECVIEING) && (rp->getfrom == proc_number(sp) || rp->getfrom == ANY )){
        memcpy(&(rp->message),m_ptr,sizeof(Message));
        rp->wait = m_ptr->src;
        rp->flags &= ~(RECVIEING);
        ready(rp);
        unready(sp);
        return 0;
    }
    Proc **sl;
    sl = &rp->sendlink;
    sp->sendlink = NULL;
    memcpy(&(sp->message),m_ptr,sizeof(Message));
    while(*sl != NULL) sl = &((*sl)->sendlink);
    *sl = sp;
    sp->flags |= SENDING;
    unready(sp);
    return 0;
}

int interrupt(pid_t dest,Message *m_ptr){
    Proc *rp;
    Interrput *inte;
    m_ptr->src = HARDWORE;
    if(NULL == (rp = proc_addr(dest))) panic("\erInterrupt    \eb[\ersystem tasks don't found\eb]");
    if((rp->flags & RECVIEING)){
        memcpy(&(rp->message),m_ptr,sizeof(Message));
        rp->wait = HARDWORE;
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
    Proc *rp,*np,**sp;
    Interrput *inte;
    rp = act_proc;
    sp = &((rp)->sendlink);
    np = rp->sendlink;

    if((inte = rp->interruptlink)){
        rp->interruptlink = inte->next;
        memcpy(m_ptr,&(inte->message),sizeof(Message));
        free(inte);
        return 0;
    } 
    while(np != NULL){
        if(isrecv(src,proc_number(np))){
            if((np->flags & SENDING)){
                *sp = np->sendlink;
                memcpy(m_ptr,&(np->message),sizeof(Message));
                np->flags &= ~(SENDING);
                ready(np);
                return 0;
            }
        }
        sp = &((*sp)->sendlink);
        np = np->sendlink;
    }
    rp->flags |= RECVIEING;
    rp->getfrom = src;
    unready(rp);
    memcpy(m_ptr,&(rp->message),sizeof(Message));
    if(rp->wait != HARDWORE)  ready(proc_addr(rp->wait));
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

int system_main(void){
    Message m;
    m.type = GET_TIME;
    send(CLOCK_PID,&m);
    unready(act_proc);
    while(1);
}

Proc *make_proc(pid_t pid,const char *pname,Pointer data,Pointer code,int pri,int (*pentry)()){
    Proc    *p;
    p = (Proc*)get_free_page();
    p->pid = pid;
    p->pri = pri;
    p->core = getcr3();
    p->esp0 = (Pointer)p + sizeof(Task);
    strcpy(p->pname,pname);
    p->sendlink = NULL;
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
    make_proc(SYSTEM_PID,"Sytem",KERNEL_DATA,KERNEL_CODE,PRI_TASK,system_main);

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
