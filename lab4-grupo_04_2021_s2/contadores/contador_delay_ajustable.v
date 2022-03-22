`timescale 10ns / 100ps

module ContadorDelayAjustable #(
    parameter DELAY_IN_CYCLES = 2,
    parameter COUNTER_WIDTH = 2) (
    input clk,
    input rst,
    output reg [COUNTER_WIDTH-1:0] o_count);

    initial o_count = 0;
    reg [31:0] cycle_counter = 1;

    always @ ( posedge clk ) begin
        if ( rst == 1) begin
            cycle_counter <= 1;
            o_count = 0;
        end
        else if ( cycle_counter < DELAY_IN_CYCLES)
            cycle_counter <= cycle_counter + 1;
        else begin
            cycle_counter <= 1;
            o_count = o_count + 1;
        end
    end

endmodule