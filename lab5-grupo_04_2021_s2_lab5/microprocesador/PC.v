`timescale 1ns / 1ps

module ProgramCounter #(parameter N=4)(
    jumpDir, PC_o, clk, sel
);

	input       [N-1:0] jumpDir;
	input                   clk;
	input         [1:0] sel;

	output reg  [N-1:0]  PC_o;

    initial PC_o = 32'b110010;

    always @(posedge clk)
    begin
    	case (sel)

            // reset
            2'b00: PC_o <= 0;

            // hold
            2'b01:  PC_o <= PC_o;

            // PC+4
            2'b10:  PC_o <= (PC_o + 3'b100);
            
            // jump
            2'b11: PC_o <= jumpDir;
    	endcase
    end

endmodule