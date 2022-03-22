`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.09.2021 16:34:31
// Design Name: 
// Module Name: ROMTORAM
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


module ROMTORAM #(DATA_WIDTH=3, parameter M=7)(input clk,
                  input wire [M:0] addr,
                  input WE,
                  output [DATA_WIDTH:0] q);
                  
 wire [DATA_WIDTH:0] conect;  
 
 begin 

rom1 u1( .clk(clk),.addr(addr),.data(conect));

ram16x4 u2(.data(conect),
.address(addr),
.WE(WE), 
.clk(clk),
.q(q));

end             
                
endmodule
