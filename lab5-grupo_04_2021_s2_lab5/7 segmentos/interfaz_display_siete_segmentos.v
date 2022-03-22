`timescale 10ns / 100ps

/* poner CYCLES_PER_DISPLAY en 200_000
para tener un delay de 2 ms por display */

module InterfazDisplaySieteSegmentos #(
	parameter CYCLES_PER_DISPLAY=1 )(
	input clk,
	input [15:0] i_binary_coded_value,
	output reg [7:0] o_seven_segments,
	output reg [3:0] o_anode_pins
);

	initial o_seven_segments = 8'b0;
	initial o_anode_pins = 4'b0;

	wire [1:0] display_to_activate;

	ContadorDelayAjustable #(
		.DELAY_IN_CYCLES(CYCLES_PER_DISPLAY),
		.COUNTER_WIDTH(2)
	) CDA (
		.clk(clk),
		.rst(0),
		.o_count(display_to_activate)
	);

	wire [31:0] decoder_outputs;
	DecodificadorSieteSegmentos DSS [3:0] (
		.i_binary_coded_value(i_binary_coded_value),
		.o_seven_segments(decoder_outputs)
	);

	always @( display_to_activate ) begin
		case ( display_to_activate )
			2'h0: begin
				o_seven_segments = decoder_outputs[7:0];
				o_anode_pins = 4'b1110;
			end
			2'h1: begin
				o_seven_segments = decoder_outputs[15:8];
				o_anode_pins = 4'b1101;
			end
			2'h2: begin
				o_seven_segments = decoder_outputs[23:16];
				o_anode_pins = 4'b1011;
			end
			2'h3: begin
				o_seven_segments = decoder_outputs[31:24];
				o_anode_pins = 4'b0111;
			end
			default: begin
				o_seven_segments = decoder_outputs[7:0];
				o_anode_pins = 4'b1110;
			end
		endcase
	end

endmodule // DecodificadorSieteSegmentos
   
