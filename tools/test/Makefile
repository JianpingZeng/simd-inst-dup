CC=clang++
CFLAGS=-c -O3 -emit-llvm -I/usr/include/i386-linux-gnu/c++/4.8

all:test.bc

test.bc:
	$(CC) $(CFLAGS) -o test.bc test.cpp

clean:
	rm -rf test.bc
