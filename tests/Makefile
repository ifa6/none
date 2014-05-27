#
#	样板Makefile文件,集体项目根据实际情况进行简单修改即可
#	Author : lzy
.PHONY:all clean
# LIBS 
STATIC_LIBARY :=  posix c
SUBDIR		  := true

ifeq ($(ROOT_DIR),"")
$(error Undefined project root directory, you should run the 'source tools/setenv.sh' in the project root directory.)
else
include $(ROOT_DIR)/tools/Makefile.rule
endif
