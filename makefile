#以下是指定编译器路径
CC      := g++

AR := ar rc

#以下是指定编译需要的头文件
INCLUDE := -I./ -I../common/

#以下是指定需要的库文件 -L
LIBS    := -lrt

#以下是指定需要的库文件路径
LIBPATH := 


#以下是源文件
#wildcard把 指定目录 ./ 和 ../common/ 下的所有后缀是cpp的文件全部展开。
SRCS    := $(wildcard *.cpp ../common/*.cpp)

#notdir把展开的文件去除掉路径信息
DIR = $(notdir $(SRCS))

#以下是指定目标文件 所有当.cpp文件变成.o文件
OBJS    := $(DIR:.cpp=.o)


#以下是编译选项
CFLAGS  := -g -Wall -c $(INCLUDE) $(LIBPATH) 

#以下是指定目标文件
TARGETLIB := libserver.a

all:
	$(CC) $(CFLAGS) $(SRCS) $(LIBS)
	$(AR) $(TARGETLIB) $(OBJS) 

#make clean 删除所有的.o文件
clean:
	rm -f ./*.o
