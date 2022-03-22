`timescale 10ns / 100ps

module Experimento1Top #(
    parameter DATA_DELAY_IN_CYCLES = 2,
    parameter DISPLAY_DELAY_IN_CYCLES = 1 ) (
    input clk,
    input we,
	output [7:0] o_seven_segments,
	output [3:0] o_anode_pins);

    parameter NUM_BITS = 16;
    
    wire data_clk;
    ContadorDelayAjustable #(
        .DELAY_IN_CYCLES(DATA_DELAY_IN_CYCLES),
        .COUNTER_WIDTH(1)
    ) contador_delay_ajustable (
        .clk(clk),
        .rst(1'b0),
        .o_count(data_clk)
    );

    wire [NUM_BITS-1:0] generated_data;
    LFSR #(.NUM_BITS(NUM_BITS)) lfsr (
        .i_Clk(data_clk),
        .i_Enable(1'b1),
        .o_LFSR_Data(generated_data)
    );

    wire [NUM_BITS-1:0] register_data;
    RegistroPIPO #(
        .REGISTER_WIDTH(NUM_BITS)
    ) registro (
        .we(we),
        .clk(clk),
        .rst(0'b0),
        .i_data(generated_data),
        .o_data(register_data)
    );

    InterfazDisplaySieteSegmentos #(
        .CYCLES_PER_DISPLAY(DISPLAY_DELAY_IN_CYCLES)
    ) idss (
	    .clk(clk),
        .i_binary_coded_value(register_data),
        .o_seven_segments(o_seven_segments),
        .o_anode_pins(o_anode_pins)
    );

endmodule