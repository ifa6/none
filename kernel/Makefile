#
#	样板Makefile文件,集体项目根据实际情况进行简单修改即可
#	Author : lzy
STATIC_LIBARY := posix c fs
module_name	  := none
BUILD		  := BINARY
ENTRY 		  := 0x305000
src_dirs 	  := mm drivers drivers/input rootfs
cleans 		  := offsets.h

ifeq ($(root_dir),"")
$(error Undefined project root directory, you should run the 'source tools/setenv.sh' in the project root directory.)
else
include $(root_dir)/tools/Makefile.rule
endif
-include kernel.mk
