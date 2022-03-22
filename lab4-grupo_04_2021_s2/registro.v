`timescale 1ns / 1ps

module banco_de_registros #(parameter M=32)
   (data_in1, data_in2, w1,w2, clk, rst, out1);
   
   input 	 w1, w2, clk, rst;
   input [M-1:0] data_in1, data_in2;
   output [M-1:0] out1;

   reg [M-1:0] 	      _registro=32'b1;
   
   always @ (posedge clk) begin
      if (rst) _registro <= 0;
      if (w1 & ~rst & ~w2) begin
        _registro <= data_in1;
        end
      if (w2 & ~rst & ~w1) begin
        _registro <= data_in2;
        end
      if (w1 & ~rst & w2) begin
        _registro <= data_in1;
        end
   end
   
  assign out1 = _registro;
   
endmodule // banco_de_registros
