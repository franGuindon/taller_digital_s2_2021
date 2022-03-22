`timescale 10ns / 100ps

module ContadorDelayVariable #(
    parameter COUNTER_WIDTH = 2) (
    input clk,
    input rst,
    input [31:0] i_delay_cycles,
    output reg [COUNTER_WIDTH-1:0] o_count);

    initial o_count = 0;

    reg [31:0] cycle_counter = 1;
    reg [31:0] delay_cycles = 0;

    always @ ( posedge clk ) begin
        delay_cycles <= i_delay_cycles;
        if ( rst == 1) begin
            cycle_counter <= 1;
            o_count <= 0;
        end
        else if ( cycle_counter < delay_cycles)
            cycle_counter <= cycle_counter + 1;
        else begin
            cycle_counter <= 1;
            o_count <= o_count + 1;
        end
    end

endmodule