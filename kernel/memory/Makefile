CC = m68k-linux-gnu-gcc
LD = m68k-linux-gnu-ld
CFLAGS = -Wno-incompatible-library-redeclaration

mem.o: mem.c
	$(CC) -c $? -o $<

clean:
	rm -f *.o
