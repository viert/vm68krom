CC = m68k-linux-gnu-gcc
LD = m68k-linux-gnu-ld
CFLAGS = -fno-builtin-puts -fnobuiltin-putc

crt.o: crt.c
	$(CC) -c $? -o $@

clean:
	rm -f *.o
