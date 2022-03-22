`timescale 10ns / 100ps

module RouterDatos (
    input clk,
    input direction,
    input [7:0] i_data,
    inout [7:0] io_data,
    output [7:0] o_data );

    reg [7:0] in = 0;
    reg [7:0] out = 0;

    assign io_data = direction ? 7'bz : in;
    assign o_data = out;

    always @ ( posedge clk ) begin
        in <= i_data;
        if (direction == 1'b1) begin
            out <= io_data;
        end
    end

endmodule