# Makefile for install.
# Install ask root.

.PHONY: all libs kernel modules demo clean \
	install uninstall  go

# Directories.
out_dir  	:= out
ramdisk 	:= ramdisk.img
disk		:= c.img
kernel_bin 	:= $(out_dir)/bin/none 
kernel_dir  := $(out_dir)/mnt/disk
modules_dir := $(out_dir)/mnt/ramdisk

LIBDIR 		:= libs
KERNELDIR 	:= kernel
DEMODIR 	:= demo
MODULESDIR  := modules

MAKE = make
RM = rm
$(shell mkdir -p  $(kernel_dir) $(modules_dir))

all : libs kernel demo

kernel :  libs
	@$(MAKE) -s -C $(KERNELDIR)

libs :
	@$(MAKE) -s -C $(LIBDIR)

modules : libs
	@$(MAKE) -s -C $(MODULESDIR)

demo : libs
	@$(MAKE) -s -C $(DEMODIR)

install : 
	@echo "Install modules to ramdisk."
	@-mount $(ramdisk) $(modules_dir)
	@chmod a+w $(modules_dir)
	@-cp $(out_dir)/bin $(modules_dir)/ -r
	@-rm -f -- $(modules_dir)/bin/none
	@sleep 1
	@umount $(modules_dir)
	@echo "Install kernel to hardisk."
	@-mount $(disk) $(kernel_dir)
	@chmod a+w $(kernel_dir)
	@-cp $(kernel_bin) $(kernel_dir)/
	@-cp $(ramdisk) $(kernel_dir)/
	@sleep 1

uninstall :
	@-umount $(kernel_dir)
	@-umount $(modules_dir)

go: install uninstall
	@bochs -q

clean:
	@-rm -rf -- out/
	@-rm -f -- *.out *.src tags *.swap
