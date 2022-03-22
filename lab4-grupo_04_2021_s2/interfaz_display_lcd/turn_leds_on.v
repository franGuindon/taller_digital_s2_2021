`timescale 1ns / 1ps

module TurnLedsOn (
    input [7:0] data_data,
    output reg [3:0] contr_PMOD,
    output [7:0] PMOD);

    initial contr_PMOD = 4'hA;
    assign PMOD = data_data;

endmodule