`timescale 10ns / 100ps

module DecodificadorSieteSegmentos (
	input [3:0] i_binary_coded_value,
	output reg [7:0] o_seven_segments);
	
	initial o_seven_segments = 0;

	always @(i_binary_coded_value) begin
		case (i_binary_coded_value)
			4'h0: o_seven_segments = 8'b00000011;
			4'h1: o_seven_segments = 8'b10011111;
			4'h2: o_seven_segments = 8'b00100101;
			4'h3: o_seven_segments = 8'b00001101;
			4'h4: o_seven_segments = 8'b10011001;
			4'h5: o_seven_segments = 8'b01001001;
			4'h6: o_seven_segments = 8'b01000001;
			4'h7: o_seven_segments = 8'b00011111;
			4'h8: o_seven_segments = 8'b00000001;
			4'h9: o_seven_segments = 8'b00011001;
			4'ha: o_seven_segments = 8'b00010001;
			4'hb: o_seven_segments = 8'b11000001;
			4'hc: o_seven_segments = 8'b01100011;
			4'hd: o_seven_segments = 8'b10000101;
			4'he: o_seven_segments = 8'b01100001;
			4'hf: o_seven_segments = 8'b01110001;
		endcase // case (i_binary_coded_value)
	end
endmodule // DecodificadorSieteSegmentos
   
