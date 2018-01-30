        .text

        .global read_bootloader
        .global read_sync
        .global boot_prg_start
        .extern user_exc_int5

        .equ    hdd_cmd,        0x007F5500
        .equ    hdd_status,     0x007F5501
        .equ    hdd_cmdarg,     0x007F5502
        .equ    hdd_buffer,     0x007F5300
        .equ    boot_prg_start, 0x00001200
        .equ    hdd_cmd_read,   0x02

; # void read_sync(int sector_number, int sector_count, char* buffer)
read_sync:
        movem.l     %a0-%a1/%d0-%d3, -(%sp)
        move.l      28(%sp), %d0            ; # sector number
        move.l      32(%sp), %d3            ; # sectors count
        subq        #1, %d3                 ; # m68k counters count down to -1
        move.l      36(%sp), %a0            ; # buffer start
        moveq       #hdd_cmd_read, %d1      ; # cmd_read cache
        move.l      #hdd_ready, user_exc_int5

read_sector_incr_loop:
        andi.w      #0b1111100011111111, %sr ; # enable interrupts
        move.l      %d0, hdd_cmdarg
        move.b      %d1, hdd_cmd

read_sector_halt:
        bra         read_sector_halt

hdd_ready:
        addq        #6, %sp                 ; # not gonna return from this interrupt
        move.l      #hdd_buffer, %a1
        move.l      #0x7F, %d2              ; # 0x80 * 4 = 512 bytes to copy
sector_copy_loop:
        move.l      (%a1)+, (%a0)+
        dbf         %d2, sector_copy_loop
        addq        #1, %d0                 ; # next sector
        dbf         %d3, read_sector_incr_loop
        
        movem.l     (%sp)+, %a0-%a1/%d0-%d3
        move.w      (%sp)+, %sr
        rts

read_bootloader:
        move.l      #boot_prg_start, -(%sp) ; # read_sync
        move.l      #2, -(%sp)              ; # 2 sectors
        move.l      #0, -(%sp)              ; # starting from sector 0
        trap        #0                      ; # call read_sync
        rts

int_mask:
        andi.w      #0b1111100011111111, %sr
        rts
