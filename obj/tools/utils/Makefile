
# Don't do -D__inline__= as this bones sys/stat.h
CFLAGS+= -DPRINT_CONFLICTS -DPRIEPSET -D_GNU_SOURCE -D_XOPEN_SOURCE=600 -Wall -pedantic -Wno-long-long -g -O0 -I.
CXXFLAGS+= -D_XOPEN_SOURCE=600 -Wall -pedantic -Wno-long-long -g -O1 -I.

%.o : %.cxx
	g++ -c $(CXXFLAGS) -o $@ $<

%.o : %.c
	gcc -c $(CXXFLAGS) -o $@ $<

%.o : %.S
	gcc -c $(CFLAGS) -o $@ $<

#all: MemoryMap.o debug_new.o utils.o
all: utils.o

clean:
	rm -rf *.o

