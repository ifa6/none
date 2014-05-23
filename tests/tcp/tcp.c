#include <stdio.h>
#include "lwip/tcp.h"
#include "netif/etharp.h"
#include "lwip/init.h"
#define IP_MASK {255,255,255,0}
#define IP {192,168,0,64}
#define GATEWAY {192,168,0,1}

extern err_t ethernetif_init(struct netif *netif);
struct netif ne2k_netif;

static err_t tcp_connected(void *arg,struct tcp_pcb *pcb,err_t err){
    tcp_write(pcb,"hello world!\n",sizeof("hello world!\n"),0);
    tcp_close(pcb);
    return ERR_OK;
}
int main(void){
    
    struct tcp_pcb *pcb;
    struct ip_addr ipaddr,netmask,gw;
    struct ip_addr ip;

    lwip_init();
    IP4_ADDR(&gw,192,168,1,1);
    IP4_ADDR(&netmask,255,255,255,0);
    IP4_ADDR(&ipaddr,192,168,1,74);
    netif_add(&ne2k_netif,&ipaddr,&netmask,&gw,NULL,ethernetif_init,ethernet_input);
    netif_set_default(&ne2k_netif);
    netif_set_up(&ne2k_netif);

    pcb = tcp_new();
    IP4_ADDR(&ip,192,168,1,1);
    tcp_bind(pcb,IP_ADDR_ANY,5000);
    tcp_connect(pcb,&ip,5000,tcp_connected);

    return 0;
}
