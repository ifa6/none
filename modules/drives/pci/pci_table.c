#include "pci.h"

struct pci_isabridge pci_isabridge[] = {
    {0x1022, 0x7410, 1, PCI_IB_AMD, "AMD-766"},
    {0x1039, 0x0008, 1, PCI_IB_SIS, "SiS 85C503/5513"},
    {0x10b9, 0x1533, 1, PCI_IB_PIIX,"ALI M1533"},
    {0x1106, 0x0686, 1, PCI_IB_VIA, "VIA VT82C686"},
    {0x1106, 0x3074, 1, PCI_IB_VIA, "VIA VT8233"},
    {0x1106, 0x3227, 1, PCI_IB_VIA, "VIA"},
    {0x8086, 0x122e, 1, PCI_IB_PIIX,"Intel 82371FB"},
    {0x8086, 0x2440, 1, PCI_IB_PIIX,"Intel 82801B"},
    {0x8086, 0x7000, 1, PCI_IB_PIIX,"Intel 82371SB"},
    {0x8086, 0x7030, 1, PCI_IB_PIIX,"Intel 82437VX"},
    {0x8086, 0x7100, 1, PCI_IB_PIIX,"Intel 82371AB"},
    {0x8086, 0x7110, 1, PCI_IB_PIIX,"Intel PIIX4"},
    {0x8086, 0x7124, 1, PCI_IB_PIIX,"Intel 82801AA"},
    {0x0000, 0x0000, 1, 0,"Error Brigde"}
};
