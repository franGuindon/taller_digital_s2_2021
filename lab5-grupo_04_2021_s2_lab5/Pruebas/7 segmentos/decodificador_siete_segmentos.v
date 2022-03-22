`timescale 10ns / 100ps

module DecodificadorSieteSegmentos (
	input [3:0] i_binary_coded_value,
	output reg [7:0] o_seven_segments);
	
	initial o_seven_segments = 0;

	always @(i_binary_coded_value) begin
		case (i_binary_coded_value)
			4'h0: o_seven_segments = 8'b1100_0000; // 00000011; 1100_0000;
			4'h1: o_seven_segments = 8'b1111_1001; // 10011111; 1111_1001;
			4'h2: o_seven_segments = 8'b1010_0100; // 00100101; 1010_0100;
			4'h3: o_seven_segments = 8'b1011_0000; // 00001101; 1011_0000;
			4'h4: o_seven_segments = 8'b1001_1001; // 10011001; 1001_1001;
			4'h5: o_seven_segments = 8'b1001_0010; // 01001001; 1001_0010;
			4'h6: o_seven_segments = 8'b1000_0010; // 01000001; 1000_0010;
			4'h7: o_seven_segments = 8'b1111_1000; // 00011111; 1111_1000;
			4'h8: o_seven_segments = 8'b1000_0000; // 00000001; 1000_0000;
			4'h9: o_seven_segments = 8'b1001_1000; // 00011001; 1001_1000;
			4'ha: o_seven_segments = 8'b1000_1000; // 00010001; 1000_1000;
			4'hb: o_seven_segments = 8'b1000_0011; // 11000001; 1000_0011;
			4'hc: o_seven_segments = 8'b1100_0110; // 01100011; 1100_0110;
			4'hd: o_seven_segments = 8'b1010_0001; // 10000101; 1010_0001;
			4'he: o_seven_segments = 8'b1000_0110; // 01100001; 1000_0110;
			4'hf: o_seven_segments = 8'b1000_1110; // 01110001; 1000_1110;
		endcase // case (i_binary_coded_value)
	end
endmodule // DecodificadorSieteSegmentos
   
