        .data
        .global user_interrupt_table
        .global user_exc_int1
        .global user_exc_int2
        .global user_exc_int3
        .global user_exc_int4
        .global user_exc_int5
        .global user_exc_int6
        .global user_exc_int7

        .equ    user_interrupt_table,       0x00001000
        .equ    user_exc_int1,              0x00001064
        .equ    user_exc_int2,              0x00001068
        .equ    user_exc_int3,              0x0000106C
        .equ    user_exc_int4,              0x00001070
        .equ    user_exc_int5,              0x00001074
        .equ    user_exc_int6,              0x00001078
        .equ    user_exc_int7,              0x0000107C
