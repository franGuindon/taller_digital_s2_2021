`timescale 1ns / 1ps

module LedPulsante(
    input clk,
    output led);
    
    assign led = clk;

endmodule