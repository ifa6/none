# Makefile for install.
# Install ask root.
#
.PHONY:go all clean 

# Directories.
# root directories
OUT_DIR  := out
ifeq ("$(RAMDISK)",1)
h 		:= ramdisk.img
else
h		:= c.img
endif
s 		:= $(OUT_DIR)/bin/none 
hw		:= $(OUT_DIR)/mnt/hw

FSDIR 		:= fs
LIBDIR 		:= libs
KERNELDIR 	:= kernel
DEMODIR 	:= demo
MMDIR 		:= mm
DEVICEDIR	:= device
subdirs 	:= \
	$(LIBDIR)\
	$(FSDIR)\
	$(MMDIR)\
	$(DEVICEDIR)\
	$(KERNELDIR)\
	$(DEMODIR) \

MAKE = make
RM = rm
$(shell mkdir -p  $(hw))

all :
	@for dir in  $(subdirs);do\
		$(MAKE) -s -C $$dir $$@ || exit 1;\
	done

host:
	@cp $s $h /boot/

install: $s
	@-mount $h $(hw)
	@chmod a+w $(hw)
	@-cp $(OUT_DIR)/bin/ $(hw)/ -r
	@sleep 1

uninstall:
	@-umount $(hw)

go: install uninstall
	@mount  $h $(hw)
	@-cp $s $(hw)
	@sleep 1
	@-umount $(hw)
	@bochs

clean:
	@-rm -rf -- objs/
	@-rm -f -- *.out *.src tags *.swap
	@for dir in $(subdirs);do\
		$(MAKE) -s -C $$dir $@ || exit 1;\
	done


