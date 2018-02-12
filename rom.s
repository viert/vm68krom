        .text
        
        .extern set_color
        .extern set_cursor_pos
        .extern puts
        .extern read_bootloader
        .extern boot_prg_start

        .extern user_interrupt_table      

        .org    0x00000000
        .long   0x00800000      ; # 00 SP
        .long   start           ; # 01 PC
        .long   exc_bus_err
        .long   exc_addr_err
        .long   exc_illegal
        .long   exc_divide0
        .long   exc_chk
        .long   exc_trapv
        .long   exc_privilege
        .long   exc_trace
        .long   exc_1010
        .long   exc_1111
        .long   exc_dummy12
        .long   exc_dummy13
        .long   exc_dummy14
        .long   exc_uninit
        .long   exc_dummy16
        .long   exc_dummy17
        .long   exc_dummy18
        .long   exc_dummy19
        .long   exc_dummy20
        .long   exc_dummy21
        .long   exc_dummy22
        .long   exc_dummy23
        .long   exc_spurious
        .long   exc_int1
        .long   exc_int2
        .long   exc_int3
        .long   exc_int4
        .long   exc_int5
        .long   exc_int6
        .long   exc_int7
        .long   exc_trap0
        .long   exc_trap1
        .long   exc_trap2
        .long   exc_trap3
        .long   exc_trap4
        .long   exc_trap5
        .long   exc_trap6
        .long   exc_trap7
        .long   exc_trap8
        .long   exc_trap9
        .long   exc_trap10
        .long   exc_trap11
        .long   exc_trap12
        .long   exc_trap13
        .long   exc_trap14
        .long   exc_trap15

jump_table_start:
                .long   0xFFFFFFFF
                .long   0xFFFFFFFF
exc_bus_err:    bsr isr_entry
exc_addr_err:   bsr isr_entry
exc_illegal:    bsr isr_entry
exc_divide0:    bsr isr_entry
exc_chk:        bsr isr_entry
exc_trapv:      bsr isr_entry
exc_privilege:  bsr isr_entry
exc_trace:      bsr isr_entry
exc_1010:       bsr isr_entry
exc_1111:       bsr isr_entry
exc_dummy12:    bsr isr_entry
exc_dummy13:    bsr isr_entry
exc_dummy14:    bsr isr_entry
exc_uninit:     bsr isr_entry
exc_dummy16:    bsr isr_entry
exc_dummy17:    bsr isr_entry
exc_dummy18:    bsr isr_entry
exc_dummy19:    bsr isr_entry
exc_dummy20:    bsr isr_entry
exc_dummy21:    bsr isr_entry
exc_dummy22:    bsr isr_entry
exc_dummy23:    bsr isr_entry
exc_spurious:   bsr isr_entry
exc_int1:       bsr isr_entry
exc_int2:       bsr isr_entry
exc_int3:       bsr isr_entry
exc_int4:       bsr isr_entry
exc_int5:       bsr isr_entry
exc_int6:       bsr isr_entry
exc_int7:       bsr isr_entry
exc_trap0:      bsr isr_entry
exc_trap1:      bsr isr_entry
exc_trap2:      bsr isr_entry
exc_trap3:      bsr isr_entry
exc_trap4:      bsr isr_entry
exc_trap5:      bsr isr_entry
exc_trap6:      bsr isr_entry
exc_trap7:      bsr isr_entry
exc_trap8:      bsr isr_entry
exc_trap9:      bsr isr_entry
exc_trap10:     bsr isr_entry
exc_trap11:     bsr isr_entry
exc_trap12:     bsr isr_entry
exc_trap13:     bsr isr_entry
exc_trap14:     bsr isr_entry
exc_trap15:     bsr isr_entry

isr_entry:
        ; # elegant hack to calculate address in user interrupt table
        move.l  (%sp)+, %a0
        adda.w  #(user_interrupt_table - jump_table_start - 4), %a0
        jmp     (%a0)

greet:
        .asciz  "VM68k Emulator BIOS is starting"

start:
        ; # set color to white
        move.b  #0x0F, %d0
        bsr     set_color

        ; # show greetings
        move.l  #greet, %a5
        bsr     puts
        move.w  #80, %d0                    ; # Since the screen is 80x60, 80 means new line start
        bsr     set_cursor_pos
        
        move.l  #read_sync, user_exc_trap0  ; # Register TRAP0 as read_sync entry

        bsr     read_bootloader             ; # Sector is read into 0x00001200
        bra     boot_prg_start

unhandled:                                  ; # halt
        bra     unhandled
