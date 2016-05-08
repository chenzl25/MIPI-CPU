SRCS  = src/main.cpp


OBJS=$(SRCS:.cpp=.o)

CXX?=g++
CPPFLAGS=-w

all: $(OBJS)
	$(CXX) -o mips-compiler $(OBJS)

main.o:

.PHONY: clean

clean:
	-rm $(OBJS) mips-compiler output.bin
