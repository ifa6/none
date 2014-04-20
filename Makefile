# Makefile for install.
# Install ask root.
#
.PHONY:go all clean 

# Directories.
# root directories
ROOT_DIR := $(PWD)
d 		:= a.img
h 		:= n.hd
s 		:= kernel/none

boot    := mnt/boot
hw		:= mnt/hw

FSDIR 		:= fs
COMMONDIR 	:= c
KERNELDIR 	:= kernel
TESTSDIR 	:= tests
MMDIR 		:= mm
EXECS 		:= $(addprefix objs/,$(basename $(wildcard $(TESTSDIR)/*.c)))
SUBDIRS 	:= \
	$(COMMONDIR)\
	$(FSDIR)\
	$(MMDIR)\
	$(KERNELDIR)\
	$(TESTSDIR) \

MAKE = make
RM = rm
$(shell mkdir -p $(boot) $(hw))


all :
	@for dir in  $(SUBDIRS);do\
		$(MAKE)  -s -C $$dir V=$V $$* || exit 1;\
	done

debug:
	@objdump -d $(OBJS)/kernel/none > t.src

install: $s
	@-mount -o loop -t ext2 $d $(boot)
	@-mount $h $(hw)
	@chmod a+w $(hw) $(boot)
	@-cp $(EXECS) $(hw)
	@sleep 1

uninstall:
	@-umount $(boot)
	@-umount $(hw)

go: install uninstall
	@mount -o loop -t ext2 $d $(boot)
	@-cp $s $(boot)
	@sleep 1
	@-umount $(boot)
	@bochs

clean:
	@-rm -rf -- lib/
	@-rm -rf -- objs/
	@-rm -f -- *.out *.src tags *.swap
	@for dir in $(SUBDIRS);do\
		$(MAKE) -s -C $$dir $@ || exit 1;\
	done
