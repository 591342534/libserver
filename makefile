#������ָ��������·��
CC      := g++

AR := ar rc

# args
BITS := 32
DEBUG := 1
T := .a

#������ָ����Ҫ�Ŀ��ļ� -L
LIBS    := -lrt -lpthread

#������ָ��������Ҫ��ͷ�ļ�
INCLUDE := -I./

#������lib·��
LDFLAGS :=

#������Դ�ļ�
SRCS    := *.cpp

#������ָ��Ŀ���ļ� ���е�.cpp�ļ����.o�ļ�
OBJS    := $(SRCS:.cpp=.o)

#�����Ǳ���ѡ��
CFLAGS  := -Wall $(INCLUDE) 

#[args]  make DEBUG=1
ifeq ($(DEBUG),1)
	CFLAGS += -g
else
	CFLAGS += -DNDEBUG
endif

#[args]  make BITS=32
ifeq ($(BITS),64)
	CFLAGS += -m64
else
	CFLAGS += -m32
endif


#.a
ifeq ("$(T)", ".a")
  CFLAGS += -c
  TARGET = libserver.a
  target_lib:
	$(CC) $(CFLAGS) $(SRCS) $(LDFLAGS) $(LIBS)
	$(AR) $(TARGET) $(OBJS) 
endif	

#so
ifeq ("$(T)", "so")
  TARGET := libserver.so
  CFLAGS += -o
  LDFLAGS += -fPIC -shared
  target_so:
	$(CC) $(CFLAGS) $(TARGET) $(SRCS) $(LDFLAGS) $(LIBS) 
endif

#make clean ɾ�����е�.o�ļ�
clean:
	rm -f ./*.o
