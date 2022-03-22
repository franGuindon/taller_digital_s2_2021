`timescale 1ns / 1ps

module Prueba_Program_Counter (
    sw, led, clk
);
	input         [5:0] sw;
	input               clk;
	output        [3:0] led;

    reg clkdiv = 0;
    integer i = 0;

    always @(posedge clk) begin
        if (i < 100_000_000) i= i + 1;
        else begin
            i = 0;
            clkdiv = ~clkdiv;
        end
    end

    ProgramCounter ctr(.PC_o(led), 
       .jumpDir(sw[3:0]), .sel(sw[5:4]), 
       .clk(clkdiv));

endmodule