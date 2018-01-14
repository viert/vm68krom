        .text
        .extern set_color
        .extern set_cursor_pos
        .extern puts
        .extern hdd_ready
        .extern read_sector0

        .org    0x00000000
        .long   0x00800000      ; # 00 SP
        .long   start           ; # 01 PC
        .long   unhandled       ; # 02 Bus error
        .long   unhandled       ; # 03 Address error
        .long   unhandled       ; # 04 Illegal Instruction
        .long   unhandled       ; # 05 Division by zero
        .long   unhandled       ; # 06 CHK
        .long   unhandled       ; # 07 TRAPV
        .long   unhandled       ; # 08 Privilege Violation
        .long   unhandled       ; # 09 Trace
        .long   unhandled       ; # 10 1010
        .long   unhandled       ; # 11 1111
        .long   unhandled       ; # 12
        .long   unhandled       ; # 13
        .long   unhandled       ; # 14
        .long   unhandled       ; # 15 Uninitialized interrupt
        .long   unhandled       ; # 16
        .long   unhandled       ; # 17
        .long   unhandled       ; # 18
        .long   unhandled       ; # 19
        .long   unhandled       ; # 20
        .long   unhandled       ; # 21
        .long   unhandled       ; # 22
        .long   unhandled       ; # 23
        .long   unhandled       ; # 24 Spurious interrupt
        .long   unhandled       ; # 25 INT1
        .long   unhandled       ; # 26 INT2
        .long   unhandled       ; # 27 INT3
        .long   unhandled       ; # 28 INT4
        .long   hdd_ready       ; # 29 INT5
        .long   unhandled       ; # 30 INT6
        .long   unhandled       ; # 31 INT7
        .long   unhandled       ; # 32 TRAP 0
        .long   unhandled       ; # 33 TRAP 1
        .long   unhandled       ; # 34 TRAP 2
        .long   unhandled       ; # 35 TRAP 3
        .long   unhandled       ; # 36 TRAP 4
        .long   unhandled       ; # 37 TRAP 5
        .long   unhandled       ; # 38 TRAP 6
        .long   unhandled       ; # 39 TRAP 7
        .long   unhandled       ; # 40 TRAP 8
        .long   unhandled       ; # 41 TRAP 9
        .long   unhandled       ; # 42 TRAP 10
        .long   unhandled       ; # 43 TRAP 11
        .long   unhandled       ; # 44 TRAP 12
        .long   unhandled       ; # 45 TRAP 13
        .long   unhandled       ; # 46 TRAP 14
        .long   unhandled       ; # 47 TRAP 15

greet:
        .asciz  "VM68k Emulator BIOS is starting"

start:
        ; # set color to white
        move.b  #0x0F, %d0
        bsr     set_color

        ; # show greetings
        move.l  #greet, %a5
        bsr     puts
        move.w  #80, %d0                ; # Since the screen is 80x60, 80 means new line start
        bsr     set_cursor_pos

        bsr     read_sector0            ; # Sector is read into 0x00002000

        move.l  #0x0000205B, %a5        ; # This is the address of the FAT boot sector text
        bsr     puts

        bra     unhandled

unhandled:
        bra     unhandled
