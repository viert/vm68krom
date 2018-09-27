CC = m68k-linux-gnu-gcc
LD = m68k-linux-gnu-ld
CFLAGS = -Wno-incompatible-library-redeclaration

all: kernel.o

kernel.o: memory/mem.o crt/crt.o entry.o
	$(LD) -r $? -o kernel.o

memory/mem.o:
	$(MAKE) -C memory

crt/crt.o:
	$(MAKE) -C crt

entry.o: entry.c
	$(CC) $(CFLAGS) $? -o $@

clean:
	rm -f *.o
	$(MAKE) -C crt clean
	$(MAKE) -C memory clean
