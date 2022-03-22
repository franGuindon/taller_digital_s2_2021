`timescale 10ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.10.2021 16:08:35
// Design Name: 
// Module Name: dff
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


module dff(input key, input clk, output reg Q, output reg Qbar);

//initial Q=0;
//initial Qbar=1;

always @(posedge clk)
    begin 
        Q<=key;
        Qbar<=!Q;
    end 

endmodule
