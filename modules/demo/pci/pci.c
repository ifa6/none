#include "pci.h"
#include "pci_regs.h"
void early_dump_pci_devices(void);
int main(void) {
    early_dump_pci_devices();
}
