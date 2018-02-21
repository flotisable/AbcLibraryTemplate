abcDir 		:= $(HOME)/Applications/AbcBerkeley/abc
abcSrcDir	:= $(abcDir)/src
abcLibDir := $(abcDir)
abcFlags	:= $(shell ./getAbcFlags.sh $(abcDir))
abcLib    := $(abcLibDir)/libabc.a

INCLUDE 	:= $(abcSrcDir)
CXXFLAGS	:= -std=c++11 $(abcFlags) -I$(INCLUDE)
CXX				:= g++
LDFLAGS		:= -lreadline -lpthread -ldl -lm -lrt
LD				:= g++
PROG			:= test

all: $(PROG)

# abc library should be linked after the main function, since there is main function in abc library
$(PROG): main.o $(abcLibDir)/libabc.a 
	$(LD) $(LDFLAGS) -o $@ $^

main.o: main.cpp
	$(CXX) -c $(CXXFLAGS) -o $@ $<

clean:
	rm $(PROG) *.o
