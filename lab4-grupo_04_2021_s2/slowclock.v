`timescale 10ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.10.2021 15:58:50
// Design Name: 
// Module Name: slowclock
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


module slowclock(input clk, output  slow);

reg [1:0] sinc=0;
reg clout=0;

always @(posedge clk)
    begin 
        sinc <= sinc+1;
    if (sinc==18_000_000)
    begin
        sinc <= 0;
        clout = ~clout;
    end 
    end    
    
assign slow=clout;  

endmodule
