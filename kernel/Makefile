CC = m68k-linux-gnu-gcc
LD = m68k-linux-gnu-ld
CFLAGS = -Wno-incompatible-library-redeclaration

all: kernel.o

kernel.o: mem/mem.o crt/crt.o
	$(LD) -r $? -o kernel.o

mem/mem.o:
	$(MAKE) -C mem

crt/crt.o:
	$(MAKE) -C crt

clean:
	rm -f *.o
	$(MAKE) -C crt clean
	$(MAKE) -C mem clean
