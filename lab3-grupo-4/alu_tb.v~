`timescale 1ns / 1ps

module maquina_de_estados_tb;
`include "fileread_utils.vh"
   
   reg clk, rst;
   wire sel, we;
   wire [4:0] addr_rs1, addr_rs2, addr_rd;
   wire [3:0] op;
   reg 	      check_sel, check_we;
   reg [4:0]  check_addr_rs1, check_addr_rs2, check_addr_rd;
   reg [3:0]  check_op;

   maquina_de_estados MDE (.clk(clk),
			   .rst(rst),
			   .sel(sel),
			   .we(we),
			   .addr_rs1(addr_rs1),
			   .addr_rs2(addr_rs2),
			   .addr_rd(addr_rd),
			   .op(op));
   
   parameter data = "maquina_de_estados.dat";
   integer data_file;
   integer file_did_not_open;
   
   initial begin
      clk = 0;
      forever #40 clk = ~clk;
   end
   
   initial begin
      $display("Abriendo archivo con datos de prueba ...");
      $display("----+----------------------------+----------------------------+---------");
      $display("Ent | Salidas                    | Salidas esperadas          | Errores");
      $display("  r | s w   rs1   rs2    rd   op | s w   rs1   rs2    rd   op |");
      $display("----+----------------------------+----------------------------+---------");
      data_file = $fopen(data, "r");
      file_did_not_open = (data_file == 0);
      if (file_did_not_open) $finish;
   end
   
   always @(negedge clk) begin
      data_line = get_line_from_file(data_file);
      $sscanf(data_line, "%b %b %b %b %b %b %b",
	      rst, check_sel, check_we, check_addr_rs1,
	      check_addr_rs2, check_addr_rd, check_op);
   end
   
   always @(posedge clk) begin
      #10
      $display("  %b | %b %b %b %b %b %b | %b %b %b %b %b %b | %s",
	       rst, sel, we, addr_rs1, addr_rs2, addr_rd, op,
	       check_sel, check_we, check_addr_rs1, check_addr_rs2, check_addr_rd, check_op,
	       ((check_sel != sel) || (check_we != we) || (check_addr_rs1 != addr_rs1) || 
		(check_addr_rs2 != addr_rs2) || (check_addr_rd != addr_rd) ||
		(check_op != op) ? "ERROR" : ""));
      
      if ($feof(data_file)) begin
	 $display("----+----------------------------+----------------------------+---------");
	 $display("Cerrando archivo con datos de prueba ...");
	 $fclose(data_file);
	 $finish;
      end
   end
endmodule // banco_de_registros_tb
