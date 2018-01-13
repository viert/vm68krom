        .text
        .extern set_color
        .extern puts

        .org    0x00000000
        .long   0x00800000      ; # 00 SP
        .long   start           ; # 01 PC
        .long   unhandled       ; # 02
        .long   unhandled       ; # 03
        .long   unhandled       ; # 04
        .long   unhandled       ; # 05
        .long   unhandled       ; # 06
        .long   unhandled       ; # 07
        .long   unhandled       ; # 08
        .long   unhandled       ; # 09
        .long   unhandled       ; # 10
        .long   unhandled       ; # 11
        .long   unhandled       ; # 12
        .long   unhandled       ; # 13
        .long   unhandled       ; # 14
        .long   unhandled       ; # 15
        .long   unhandled       ; # 16
        .long   unhandled       ; # 17
        .long   unhandled       ; # 18
        .long   unhandled       ; # 19
        .long   unhandled       ; # 20
        .long   unhandled       ; # 21
        .long   unhandled       ; # 22
        .long   unhandled       ; # 23
        .long   unhandled       ; # 24
        .long   unhandled       ; # 25
        .long   unhandled       ; # 26
        .long   unhandled       ; # 27
        .long   unhandled       ; # 28
        .long   unhandled       ; # 29
        .long   unhandled       ; # 30
        .long   unhandled       ; # 31
        .long   unhandled       ; # 32
        .long   unhandled       ; # 33
        .long   unhandled       ; # 34
        .long   unhandled       ; # 35
        .long   unhandled       ; # 36
        .long   unhandled       ; # 37
        .long   unhandled       ; # 38
        .long   unhandled       ; # 39
        .long   unhandled       ; # 40
        .long   unhandled       ; # 41
        .long   unhandled       ; # 42
        .long   unhandled       ; # 43
        .long   unhandled       ; # 44
        .long   unhandled       ; # 45
        .long   unhandled       ; # 46
        .long   unhandled       ; # 47
        .long   unhandled       ; # 48
        .long   unhandled       ; # 49
        .long   unhandled       ; # 50
        .long   unhandled       ; # 51
        .long   unhandled       ; # 52
        .long   unhandled       ; # 53
        .long   unhandled       ; # 54
        .long   unhandled       ; # 55
        .long   unhandled       ; # 56
        .long   unhandled       ; # 57
        .long   unhandled       ; # 58
        .long   unhandled       ; # 59
        .long   unhandled       ; # 60
        .long   unhandled       ; # 61
        .long   unhandled       ; # 62
        .long   unhandled       ; # 63
        .long   unhandled       ; # 64

greet:
        .asciz  "Hello from VM68k Emulator"

start:
        ; # set color to white
        move.b  #0x0F, %d0
        bsr     set_color

        ; # show greetings
        move.l  #greet, %a5
        bsr     puts
        bra     unhandled

unhandled:
        bra     unhandled
