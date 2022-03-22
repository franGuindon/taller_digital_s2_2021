`timescale 1ns / 1ps

module visualizacion_led (
    input clk,
    input WE,
    input [31:0] address,
    input [31:0] data_out,
    output [15:0] led
);

reg [15:0] reg_led;

always @ ( posedge clk ) begin
    if (WE == 1'b1 & address == 32'h0140) reg_led = data_out;
end

assign led = reg_led;

endmodule