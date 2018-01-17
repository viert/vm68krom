
ASM = m68k-linux-gnu-as
LINKER = m68k-linux-gnu-ld
BINARY = vm68krom.bytes

all: $(BINARY)

$(BINARY): rom.o rom.ld putc.o boot.o int_table.o
	$(LINKER) -T rom.ld rom.o putc.o boot.o int_table.o -o $(BINARY)

rom.o: rom.s
	$(ASM) rom.s -o rom.o

putc.o: putc.s
	$(ASM) putc.s -o putc.o

boot.o: boot.s 
	$(ASM) boot.s -o boot.o

int_table.o: int_table.s 
	$(ASM) int_table.s -o int_table.o

clean:
	rm -f *.o $(BINARY)
