CC = m68k-linux-gnu-gcc
LD = m68k-linux-gnu-ld
CFLAGS = -Wno-incompatible-library-redeclaration -mcpu=68000

mem.o: mem.c
	$(CC) -c $? -o $@

clean:
	rm -f *.o
