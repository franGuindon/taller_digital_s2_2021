`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.09.2021 08:24:48
// Design Name: 
// Module Name: Testrom
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


module Testrom();
parameter DATA_WIDTH=3;
parameter M=7;
reg clk;
reg [M:0] addr;
wire [DATA_WIDTH:0] data;

rom1 rom(.clk(clk),
                .addr(addr),
                .data(data));
initial
 begin
      clk = 0;
      forever #10 clk = ~clk;
   end
 initial 
 begin
    $display("Contents of Mem after reading data file:");
    for (addr='b0; addr<'b1111; addr=addr+1'd1)
     #100;
     $display("%d:%b",addr,data);
     end

   

endmodule

