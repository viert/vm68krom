        .text
        
        .global putc
        .global puts
        .global set_cursor_pos
        .global set_color

        .equ    text_start,         0x00780000
        .equ    color_start,        0x007812C0
        .equ    cursor_pos_var,     0x00010000
        .equ    cursor_color_var,   0x00010002
putc:
        ; # d0.b should contain a character
        move.l  %a0, -(%sp)
        
        ; # setting symbol
        move.l  #text_start, %a0        
        adda.w  cursor_pos_var, %a0
        move.b  %d0, (%a0)

        ; # setting color
        move.b  cursor_color_var, %d0
        move.l  #color_start, %a0
        adda.w  cursor_pos_var, %a0
        move.b  %d0, (%a0)

        add.w   #1, cursor_pos_var
        move.l  (%sp)+, %a0
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

set_cursor_pos:
        ; # d0.w should contain a new cursor position
        move.w  %d0, cursor_pos_var
        rts

set_color:
        ; # d0.b should contain a new color
        move.b  %d0, cursor_color_var
        rts
        
