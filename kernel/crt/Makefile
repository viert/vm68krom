CC = m68k-linux-gnu-gcc
LD = m68k-linux-gnu-ld
CFLAGS = -Wno-incompatible-library-redeclaration

crt.o: crt.c
	$(CC) -c $? -o $<

clean:
	rm -f *.o
