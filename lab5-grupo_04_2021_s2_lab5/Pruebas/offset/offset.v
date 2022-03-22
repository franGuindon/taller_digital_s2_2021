`timescale 1ns / 1ps

module offset(
input [15:6]switch,input [31:0]address, input clk,
output  [31:0] datain
    );

assign datain = (address==32'h0108) ? switch : 32'bz;

endmodule
