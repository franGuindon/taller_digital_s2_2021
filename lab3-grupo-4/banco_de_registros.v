`timescale 1ns / 1ps

module banco_de_registros #(parameter N=5, parameter M=32)
   (addr_rs1, addr_rs2, addr_rd, data_in, we, clk, rst, rs1, rs2);
   
   input [N-1:0] addr_rs1, addr_rs2, addr_rd;
   input 	 we, clk, rst;
   input [M-1:0] data_in;
   output [M-1:0] rs1, rs2;

   reg [M-1:0] 	      _banco_de_registros[0:2**N-1];
   integer 	      i;
   
   always @ (posedge clk) begin
      if (rst) for (i = 0; i < 2**N; i = i + 1) _banco_de_registros[i] <= 0;
      if (we & ~rst) _banco_de_registros[addr_rd] <= data_in;
   end
   
   assign rs1 = _banco_de_registros[addr_rs1];
   assign rs2 = _banco_de_registros[addr_rs2];
   
endmodule // banco_de_registros
