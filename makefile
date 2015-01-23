#������ָ��������·��
CC      := g++

AR := ar rc

#������ָ����Ҫ�Ŀ��ļ� -L
LIBS    := -lrt -lpthread

#������ָ��������Ҫ��ͷ�ļ�
INCLUDE := -I./

#������lib·��
LIBPATH := -L./


#������Դ�ļ�
SRCS    := *.cpp

#������ָ��Ŀ���ļ� ���е�.cpp�ļ����.o�ļ�
OBJS    := $(SRCS:.cpp=.o)


#�����Ǳ���ѡ��
CFLAGS  := -g -Wall -c $(INCLUDE) $(LIBPATH) 
CFLAGS  += -DLINUX 

TARGETLIB := libserver.a
TARGETSO := libserver.so.0.0.0

all:
	$(CC) $(CFLAGS) $(SRCS) $(LIBS)
	$(AR) $(TARGETLIB) $(OBJS) 
#make clean ɾ�����е�.o�ļ�
clean:
	rm -f ./*.o
