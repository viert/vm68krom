        .data
        .global user_interrupt_table
        .global user_exc_int1
        .global user_exc_int2
        .global user_exc_int3
        .global user_exc_int4
        .global user_exc_int5
        .global user_exc_int6
        .global user_exc_int7
        .global user_exc_trap0
        .global user_exc_trap1
        .global user_exc_trap2
        .global user_exc_trap3
        .global user_exc_trap4
        .global user_exc_trap5
        .global user_exc_trap6
        .global user_exc_trap7
        .global user_exc_trap8
        .global user_exc_trap9
        .global user_exc_trap10
        .global user_exc_trap11
        .global user_exc_trap12
        .global user_exc_trap13
        .global user_exc_trap14
        .global user_exc_trap15

        .equ    user_interrupt_table,       0x00001000
        .equ    user_exc_int1,              0x00001064
        .equ    user_exc_int2,              0x00001068
        .equ    user_exc_int3,              0x0000106C
        .equ    user_exc_int4,              0x00001070
        .equ    user_exc_int5,              0x00001074
        .equ    user_exc_int6,              0x00001078
        .equ    user_exc_int7,              0x0000107C
        .equ    user_exc_trap0,             0x00001080
        .equ    user_exc_trap1,             0x00001084
        .equ    user_exc_trap2,             0x00001088
        .equ    user_exc_trap3,             0x0000108C
        .equ    user_exc_trap4,             0x00001090
        .equ    user_exc_trap5,             0x00001094
        .equ    user_exc_trap6,             0x00001098
        .equ    user_exc_trap7,             0x0000109C
        .equ    user_exc_trap8,             0x000010A0
        .equ    user_exc_trap9,             0x000010A4
        .equ    user_exc_trap10,            0x000010A8
        .equ    user_exc_trap11,            0x000010AC
        .equ    user_exc_trap12,            0x000010B0
        .equ    user_exc_trap13,            0x000010B4
        .equ    user_exc_trap14,            0x000010B8
        .equ    user_exc_trap15,            0x000010BC
