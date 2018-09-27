CC = m68k-linux-gnu-gcc
LD = m68k-linux-gnu-ld
CFLAGS = -fno-builtin-putc -fno-builtin-puts -mcpu=68000

all: kernel.o

kernel.o: memory/mem.o crt/crt.o strconv/strconv.o entry.o
	$(LD) -r $? -o kernel.o

memory/mem.o:
	$(MAKE) -C memory

crt/crt.o:
	$(MAKE) -C crt

strconv/strconv.o:
	$(MAKE) -C strconv

entry.o: entry.c
	$(CC) $(CFLAGS) -c $? -o $@

clean:
	rm -f *.o
	$(MAKE) -C crt clean
	$(MAKE) -C memory clean
