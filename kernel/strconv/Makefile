CC = m68k-linux-gnu-gcc
LD = m68k-linux-gnu-ld
CFLAGS = -fno-builtin-puts -fno-builtin-putc -mcpu=68000

strconv.o: strconv.c
	$(CC) -c $? -o $@

clean:
	rm -f *.o
