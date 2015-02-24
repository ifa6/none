#ifndef __PCI_H__
#define __PCI_H__
#include <none/types.h>

struct pci_isabridge {
    u16 vid;
    u16 did;
    int checkclass;
    int type;
    const char * const describe;
};

#define NR_DRIVERS 64

#define PCI_IB_PIIX 1   /* Intel PIIX compatible ISA bridge */
#define PCI_IB_VIA  2   /* VIA compatible ISA bridge */
#define PCI_IB_AMD  3   /* AMD compatible ISA bridge */
#define PCI_IB_SIS  4   /* SIS compatible ISA bridge */

#define PCI_PPB_STD 1   /* Standard PCI-to-PCI bridge */
#define PCI_PPB_CB  2   /* Cardbus bridge */
#define PCI_AGPB_VIA 3  /* VIA compatible AGP bridge */

extern struct pci_isabridge pci_isabridge[];

#endif
