        .text
        .global putc
        .global puts
        .equ    screen_start,   0x00780000
        .equ    cursor_pos_var,  0x00010000
putc:
        ; # d0.b should contain a character
        move.l  screen_start, %a0
        adda.l  (cursor_pos_var), %a0
        move.b  %d0, (%a0)
        add.w   #1, (cursor_pos_var)
        rts

puts:
        ; # a5.l should contain a pointer to a string
        tst.b   (%a5)
        beq     puts_stop
        move.b  (%a5)+, %d0
        jsr     putc
        bra     puts
puts_stop:
        rts
        
