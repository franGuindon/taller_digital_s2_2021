`timescale 10ns / 100ps

module FakeInterface (
    input clk,
    input [15:0] i_binary_coded_value,
    output reg [3:0] control,
    output reg [7:0] data);

    always @ ( posedge clk ) begin
        control <= i_binary_coded_value[11:8];
        data <= i_binary_coded_value[7:0];
    end

endmodule