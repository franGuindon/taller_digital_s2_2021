`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.10.2021 16:11:49
// Design Name: 
// Module Name: debouncingpush
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


module debouncingpush(
input clk,
input key,
output led
);

wire clock;
wire Q1;
wire none;
wire Q2;
wire Q2bar;

slowclock ss(.clk(clk), .slow(clock));

dff d1(.key(key), .clk(clock), .Q(Q1));

dff d2(.key(Q1), .clk(clock), .Q(Q2));

assign Q2bar = ~Q2;
assign led = Q1 & Q2bar; 
 
endmodule
