`timescale 10ns / 100ps

module RegistroPIPO #(
    parameter REGISTER_WIDTH = 16) (
    input we,
    input clk,
    input rst,
    input [REGISTER_WIDTH-1:0] i_data,
    output reg [REGISTER_WIDTH-1:0] o_data);

    initial o_data = 0;

    always @( posedge clk or posedge rst) begin
        if ( rst == 1 )
            o_data <= 0;
        else if ( we )
            o_data <= i_data;
    end

endmodule