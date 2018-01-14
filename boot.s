        .text

        .global read_sector0
        .global hdd_ready

        .equ    hdd_cmd,        0x007F5500
        .equ    hdd_status,     0x007F5501
        .equ    hdd_cmdarg,     0x007F5502
        .equ    hdd_buffer,     0x007F5300
        .equ    boot_prg_start, 0x00002000

        .equ    hdd_cmd_read,   0x02

read_sector0:
        move.l      #boot_prg_start, %a0
        bsr         int_mask
        eor.l       %d0, %d0
        move.l      %d0, hdd_cmdarg
        moveq       #hdd_cmd_read, %d0
        move.b      %d0, hdd_cmd
read_sector0_halt:
        bra         read_sector0_halt

hdd_ready:
        addq        #6, %sp ; # won't return from this interrupt
        move.l      #hdd_buffer, %a1
        move.l      #0x7F, %d1
        
sector_copy_loop:
        move.l      (%a1)+, (%a0)+
        dbf         %d1, sector_copy_loop
        rts

int_mask:
        andi.w      #0b1111100011111111, %sr
        rts
