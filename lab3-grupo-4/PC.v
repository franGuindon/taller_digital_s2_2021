`timescale 1ns / 1ps

module ProgramCounter #(parameter N=4)(jumpDir, PC_o, clk, jumpFlag, sel, PC_Inc);

	input       [N-1:0] jumpDir;
	input                   clk;
	input         [1:0] sel;

	output reg  [N-1:0]  PC_o = 0;
	output reg  [N-1:0]  PC_Inc = 0;
    output reg jumpFlag = 0;

    always @(posedge clk)
    begin
        jumpFlag <= 0;
    	case (sel)
    	2'b00: begin // reset
    	#1
    	       PC_o <= 0;
    	       #1 PC_Inc <= 0;
           end
        2'b01: #1 PC_o <= PC_o; // hold
        2'b10: #1 PC_o <= (PC_o + 3'b100); // PC+4
        2'b11: begin // jump
               #1 PC_Inc <= PC_o + 3'b100;
               #1 PC_o <= jumpDir;
               #1 jumpFlag <= 1;
    	   end
    	endcase
    end

endmodule