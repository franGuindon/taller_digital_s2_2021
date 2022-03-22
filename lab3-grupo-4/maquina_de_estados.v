`timescale 1ns / 1ps

module maquina_de_estados
  (clk, rst, sel, we, addr_rs1, addr_rs2, addr_rd, op);
   input clk, rst;
   output reg sel, we;
   output reg [4:0] addr_rs1, addr_rs2, addr_rd;
   output reg [3:0] op;

   reg modo;
   reg [3:0] estado;
   
   always @ (posedge clk) begin
      if (rst) begin
	 {modo, estado} = {1'h0, 4'h0};
	 {we, sel, addr_rs1, addr_rs2, addr_rd, op} = {1'h0, 1'h0, 5'h0, 5'h0, 5'h0, 4'h0};
      end
      if (~rst) begin
	 
	 case (modo)
	   0: begin
	      sel = 1'h0;
	      we = 1'h1;
	      addr_rs1 = 1'h0;
	      addr_rs2 = 1'h0;
	      addr_rd = {1'h0, estado};
	      op = 1'h0;
	      
	      estado = estado + 1;
	      if (estado == 11) {modo, estado} = {1'h1, 4'h0};
	   end
	   1: begin
	      sel = 1'h1;
	      we = 1'h1;
	      addr_rs1 = {1'h0, estado};
	      addr_rs2 = {1'h0, estado + 1};
	      addr_rd = {1'h0, estado + 'h14};
	      op = {1'h0, estado};
	      
	      estado = estado + 1;
	      if (estado == 10) {modo, estado} = {0, 0};
	   end
	 endcase // case (modo)
	 
      end // if (~rst)
   end // always @ (posedge clk)
   
endmodule // maquina_de_estados

   
