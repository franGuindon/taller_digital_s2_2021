loop:
    lw x1 260(x0) # leer m sw[5:2]
    add x2 x1 x1
    sw x2 320(x0) # escribir m en LEDS
    lw x1 264(x0) # leer b sw[15:6]
    addi x1 x1 10
    sw x1 328(x0) # escribir b en Display
    jal x0 loop