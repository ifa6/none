# Makefile for install.
# Install ask root.

.PHONY: all libs  libs_clean \
	kernel kernel_clean \
	modules modules_clean \
	clean install uninstall  go

# Directories.
out_dir  	:= out
ramdisk 	:= img/c.img #ramdisk.img
disk		:= img/c.img
kernel_bin 	:= $(out_dir)/bin/none 
kernel_dir  := $(out_dir)/mnt/disk
modules_dir := $(out_dir)/mnt/ramdisk

LIBDIR 		:= libs
KERNELDIR 	:= kernel
MODULESDIR  := modules
DRIVERSDIR	:= drivers
q 			:= -s
Q 			:= @

MAKE = make
RM = rm
$(shell mkdir -p  $(kernel_dir) $(modules_dir))

all : libs kernel modules

kernel :  libs
	$(Q) $(MAKE) $(q) -C $(KERNELDIR)

kernel_clean :
	$(Q) $(MAKE) $(q) -C $(KERNELDIR) clean

libs :
	$(Q) $(MAKE) $(q) -C $(LIBDIR)

libs_clean :
	$(Q) $(MAKE) $(q) -C $(LIBDIR) clean

modules : libs
	$(Q) $(MAKE) $(q) -C $(MODULESDIR)

modules_clean :
	$(Q) $(MAKE) $(q) -C $(MODULESDIR) clean

install : 
	$(Q) echo "Install modules to ramdisk."
	$(Q) -mount $(ramdisk) $(modules_dir)
	$(Q) chmod a+w $(modules_dir)
	$(Q) -cp $(out_dir)/bin $(modules_dir)/ -r
	$(Q) -rm -f -- $(modules_dir)/bin/none
	$(Q) sleep 1
	$(Q) -umount $(modules_dir)
	$(Q) echo "Install kernel to hardisk."
	$(Q) -mount $(disk) $(kernel_dir)
	$(Q) chmod a+w $(kernel_dir)
	$(Q) -cp $(kernel_bin) $(kernel_dir)/
	#$(Q) -cp $(ramdisk) $(kernel_dir)/
	$(Q) sleep 1

uninstall :
	$(Q) -umount $(kernel_dir)
	$(Q) -umount $(modules_dir)

go : install uninstall
	$(Q) bochs -q

clean : libs_clean kernel_clean modules_clean
	$(Q) -rm -rf -- out/
	$(Q) -rm -f -- *.out *.src tags *.swap
