`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.11.2021 19:04:49
// Design Name: 
// Module Name: visual7segmentos
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module visual7segmentos(
        input [31:0]dataout,
        input [31:0]address,
        input clk,
        input WE,
        output [6:0] seg,
        output [3:0] an,
        output  dp
         );

reg [31:0] binario = 0;
wire [3:0] thousands;
wire [3:0] hundreds;
wire [3:0] tens;
wire [3:0] ones;


bin_to_bcd uu(.bin(binario), 
              .thousands(thousands),
              .hundreds(hundreds), 
              .tens(tens), 
              .ones(ones));

wire [15:0] i_binary_coded_value;

InterfazDisplaySieteSegmentos #(1)ll( // 3_000_00
	.clk(clk),
	.i_binary_coded_value(i_binary_coded_value),
	.o_seven_segments({dp,seg}),
	.o_anode_pins(an));
	
always @( posedge clk) 

    begin
        if ((WE == 1'b1)&(address == 32'h0148)) binario = dataout;
    end 
	
assign i_binary_coded_value = {thousands, hundreds, tens, ones};

endmodule
