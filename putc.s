        .text
        
        .global putc
        .global puts
        .global set_cursor_pos
        .global set_color

        .equ    text_start,             0x00780000
        .equ    second_line_start,      text_start + 80
        .equ    color_start,            0x007812C0
        .equ    second_line_col_start,  color_start + 80

        .equ    cursor_pos_var,     0x00010000
        .equ    cursor_color_var,   0x00010002
        .equ    text_screen_width,  80
        .equ    text_screen_height, 60
        .equ    words_to_move,      80 * 59 / 4 - 1
        .equ    text_max_pos,       text_screen_height * text_screen_width
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
        cmpi.w  #text_max_pos, cursor_pos_var
        bmi     pos_no_overflow

        ; # moving up one line
        bsr     move_one_line_up
        addi.w  #-80, cursor_pos_var

pos_no_overflow:
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

move_one_line_up:
        movem.l %a0-%a3/%d0, -(%sp)

        move.l  #second_line_start, %a1
        move.l  #text_start, %a0

        move.l  #second_line_col_start, %a3
        move.l  #color_start, %a2

        move.l  #words_to_move, %d0

        ; # copy loop
text_move_loop:
        move.l  (%a1)+, (%a0)+
        move.l  (%a3)+, (%a2)+
        dbf     %d0, text_move_loop

        movem.l (%sp)+, %a0-%a3/%d0
        rts

set_cursor_pos:
        ; # d0.w should contain a new cursor position
        move.w  %d0, cursor_pos_var
        rts

set_color:
        ; # d0.b should contain a new color
        move.b  %d0, cursor_color_var
        rts
        
