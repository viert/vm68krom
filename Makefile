
ASM = m68k-linux-gnu-as
LINKER = m68k-linux-gnu-ld

all: rom.bin

rom.bin: rom.o rom.ld putc.o
	$(LINKER) -T rom.ld rom.o putc.o -o rom.bin

rom.o: rom.s
	$(ASM) rom.s -o rom.o

putc.o: putc.s
	$(ASM) putc.s -o putc.o

clean:
	rm *.o rom.bin
