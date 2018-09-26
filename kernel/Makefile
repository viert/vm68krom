CC = m68k-linux-gnu-gcc
LD = m68k-linux-gnu-ld
CFLAGS = -Wno-incompatible-library-redeclaration

all: kernel.o

kernel.o: mem.o crt.o
	$(LD) -r $? -o kernel.o

mem.o: mem.c mem.h
	$(CC) $(CFLAGS) -c mem.c -o mem.o

crt.o: crt.c
	$(CC) $(CFLAGS) -c crt.c -o crt.o

clean:
	rm -f *.o
