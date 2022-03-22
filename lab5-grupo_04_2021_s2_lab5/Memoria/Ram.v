`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.09.2021 14:09:29
// Design Name: 
// Module Name: Ram
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


module ram16x4 ##(parameter N=31, parameter M=31)(
input [N:0] data,
input [M:0] address,
input WE, clk,
output [N:0] q);


reg [N:0] ram [M*2+1:0];
reg [N:0] addr_reg;

always @(posedge clk)
begin
  if ( WE )
    ram[address] <= data;
  else 
   addr_reg <= address;
end

assign q= ram[addr_reg];

endmodule // ram8x4
