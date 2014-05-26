#include <stdio.h>
#include <z.h>
#include "lwip/tcp.h"
#include "netif/etharp.h"
#include "lwip/init.h"
#define IP_MASK {255,255,255,0}
#define IP {192,168,0,64}
#define GATEWAY {192,168,0,1}
#define MK_MSG(msg) msg,sizeof(msg)
#define IPS(ip) (ip >> 0) & 0xff, (ip >> 8) & 0xff , (ip >> 16) & 0xff , (ip >> 24) & 0xff

extern err_t ethernetif_init(struct netif *netif);
struct netif ne2k_netif;


static err_t recv(void *arg,struct tcp_pcb *pcb,struct pbuf *p,err_t err){
    unused(arg,err);
    if(p){
        tcp_recved(pcb,p->len);
        printf("%d.%d.%d.%d:%d> %s\n",IPS(pcb->remote_ip.addr),pcb->remote_port,p->payload);
        pbuf_free(p);
    }
    return ERR_OK;
}

static err_t connected(void *arg,struct tcp_pcb *pcb,err_t err){
    unused(arg,err);
    if(err == ERR_OK){
        printf("Local> Connect %d.%d.%d.%d:%d succes.Now write 'Welcome message'\n",IPS(pcb->remote_ip.addr),pcb->remote_port);
        err = tcp_write(pcb,MK_MSG("Welcome to lwip 1.4.0,here is none\n"),TCP_WRITE_FLAG_COPY);
        if(err != ERR_OK){
            printf("Local> Can't send 'Welcome message' to remote\n");
        }
    } else {
        printf("Local> Connect remote failed,error %d\n",err);
    }
    //tcp_close(pcb);
    return ERR_OK;
}

static err_t sent(void *arg,struct tcp_pcb *pcb,u16_t len){
    unused(arg,pcb);
    printf("Local> Sent %d byte data to %d.%d.%d.%d:%d\n",len,IPS(pcb->remote_ip.addr),pcb->remote_port);
    return ERR_OK;
}

static void tcp_er(void *arg,err_t err){
    unused(arg);
    printf("Local> error %d\n",err);
}
int main(void){
    
    struct tcp_pcb *pcb = NULL;
    struct ip_addr ipaddr,netmask,gw;
    struct ip_addr ip;

    lwip_init();
    IP4_ADDR(&gw,192,168,0,1);
    IP4_ADDR(&netmask,255,255,255,0);
    IP4_ADDR(&ipaddr,192,168,0,4);
    netif_add(&ne2k_netif,&ipaddr,&netmask,&gw,NULL,ethernetif_init,ethernet_input);
    netif_set_default(&ne2k_netif);
    netif_set_up(&ne2k_netif);

    pcb = tcp_new();
    tcp_err(pcb,tcp_er);
    tcp_recv(pcb,recv);
    tcp_sent(pcb,sent);
    tcp_bind(pcb,IP_ADDR_ANY,80);

    IP4_ADDR(&ip,192,168,0,5);
    tcp_connect(pcb,&ip,5000,connected);
    void  ethernetif_input(struct netif *netif);
    while(1){
        ethernetif_input(&ne2k_netif);
    }

    return 0;
}
