#
#	样板Makefile文件,集体项目根据实际情况进行简单修改即可
#	Author : lzy
STATIC_LIBARY := mm minix device posix c
module_name	  := none
BUILD		  := BINARY
ENTRY 		  := 0x305000

ifeq ($(root_dir),"")
$(error Undefined project root directory, you should run the 'source tools/setenv.sh' in the project root directory.)
else
include $(root_dir)/tools/Makefile.rule
endif
-include kernel.mk
