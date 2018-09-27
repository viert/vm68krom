AS = m68k-linux-gnu-as
LD = m68k-linux-gnu-ld
BINARY = vm68krom.bytes

all: $(BINARY)

$(BINARY): rom.o rom.ld boot.o int_table.o kernel/kernel.o
	$(LD) -T rom.ld rom.o boot.o int_table.o kernel/kernel.o -o $(BINARY)

rom.o: rom.s
	$(AS) rom.s -o rom.o

boot.o: boot.s 
	$(AS) boot.s -o boot.o

int_table.o: int_table.s 
	$(AS) int_table.s -o int_table.o

kernel/kernel.o:
	$(MAKE) -C kernel

clean:
	rm -f *.o $(BINARY)
	$(MAKE) -C kernel clean
