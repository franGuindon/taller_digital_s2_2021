# sensor = 0x0100 = 256
# multiplier = 0x0104 = 260
# offset = 0x0108 = 264
# counter = 0x010C = 268
# LEDS = 0x0140 = 320
# 7_segs = 0x0148 = 328

    addi x7 x0 0 #1
    addi x6 x0 0
    sw 268(x0)
main:
    lw x2 256(x0) # pc = 2*4 = 8
    lw x3 260(x0)
    lw x5 264(x0)
    addi x14 x0 9 #6
    sub x11 x14 x3
saturate_multiplier:
    addi x14 x0 31
    srl x11 x11 x14
    beq x11 x0 saturate_offset
    addi x3 x0 9 #11
saturate_offset:
    addi x14 x0 793
    sub x11 x14 x5
    addi x14 x0 31
    srl x11 x11 x14
    beq x11 x0 russian_multiplication # 16
    addi x5 x0 792
russian_multiplication:
    addi x1 x0 0
    addi x14 x0 1
check_odd_parity:
    andi x4 x3 1 // pc = 19*4 = 76
    beq x4 x0 mult_by_2_div_by_2 # 21
    add x1 x1 x2
mult_by_2_div_by_2:
    srl x3 x3 x14
    sll x2 x2 x14
    beq x3 x0 divide_by_64
    jal x0 check_odd_parity #26 // pc = 25*4 = 100 imm = -24
divide_by_64:
    addi x14 x0 6
    srl x1 x1 x14
    add x1 x1 x5
    sw x1 328(x0)
    sw x1 0(x6) #31
    addi x6 x6 4
    andi x6 x6 15
    add x7 x7 x1
    addi x14 x0 4
    srl x8 x7 x14 #36
    addi x10 x0 0
    addi x14 x0 1
add_1_to_led_data:
    sll x10 x10 x14
    ori x10 x10 1
    addi x8 x8 -625 #41
    addi x14 x0 31
    srl x9 x8 x14
    beq x8 x0 write_leds
    beq x9 x0 add_1_to_led_data
write_leds:
    sw x10 320(x0) #46
poll_counter_ready:
    lw x12 268(x0)
    andi x12 x12 2
    beq x12 x0 poll_counter_ready
    addi x13 x0 1
    sw x13 268(x0) #51
    jal x0 main # pc = 51*4 = 204  imm = -196 = -011000100 = 1111_1111_1111_1111_1111_1111_0011_1100