        .text

        .global read_bootloader
        .extern user_exc_int5

        .equ    hdd_cmd,        0x007F5500
        .equ    hdd_status,     0x007F5501
        .equ    hdd_cmdarg,     0x007F5502
        .equ    hdd_buffer,     0x007F5300
        .equ    boot_prg_start, 0x00001200
        .equ    hdd_cmd_read,   0x02

read_bootloader:
        move.l      #hdd_ready, %a0
        move.l      %a0, user_exc_int5 ; # setting hdd callback

        move.l      #boot_prg_start, %a0 ; # where to store read data
        eor.l       %d0, %d0 ; # d0 is the sector index, set to 0
        move.l      #0x01, %d3 ; # d3 is a counter (2 sectors)

read_sector_incr_loop:
        bsr         int_mask
        move.l      %d0, hdd_cmdarg
        moveq       #hdd_cmd_read, %d1
        move.b      %d1, hdd_cmd

read_sector_halt:
        bra         read_sector_halt

hdd_ready:
        addq        #6, %sp ; # won't return from this interrupt
        move.l      #hdd_buffer, %a1
        move.l      #0x7F, %d2 ; # 0x80 * 4 = 512 bytes to copy
        
sector_copy_loop:
        move.l      (%a1)+, (%a0)+
        dbf         %d2, sector_copy_loop

        addq        #1, %d0 ; # next sector
        dbf         %d3, read_sector_incr_loop
        rts

int_mask:
        andi.w      #0b1111100011111111, %sr
        rts
