`timescale 1ns / 1ps

module banco_de_registros_tb;
`include "fileread_utils.vh"
   
   parameter N=5;
   parameter M=32;
   reg [N-1:0] addr_rs1, addr_rs2, addr_rd;
   reg 	       we, clk, rst;
   reg [M-1:0] data_in;
   wire [M-1:0] rs1, rs2;
   reg [M-1:0] 	check_rs1, check_rs2;

   banco_de_registros #(.N(N), .M(M)) BDR (.addr_rs1(addr_rs1),
					   .addr_rs2(addr_rs2),
					   .addr_rd(addr_rd),
					   .we(we),
					   .clk(clk),
					   .rst(rst),
					   .data_in(data_in),
					   .rs1(rs1),
					   .rs2(rs2));
   
   parameter data = "banco_de_registros.dat";
   integer data_file;
   integer file_did_not_open;
   integer first_run = 1;
   
   reg [MAX_CHARS*8-1:0] data_line;
   
   initial begin
      clk = 0;
      forever #35 clk = ~clk;
   end
   
   initial begin
      $display("Abriendo archivo con datos de prueba ...");
      $display("-------------------------+-------------------+-------------------+---------");
      $display("Entradas                 | Salidas           | Salidas esperadas | Errores");
      $display("rs1 rs2  rd w r  data_in |      rs1      rs2 |      rs1      rs2 |");
      $display("-------------------------+-------------------+-------------------+---------");
      data_file = $fopen(data, "r");
      file_did_not_open = (data_file == 0);
      if (file_did_not_open) $finish;
   end
   
   always @(negedge clk) begin
      data_line = get_line_from_file(data_file);
      $sscanf(data_line, "%b %b %b %b %b %b %b %b",
	      addr_rs1, addr_rs2, addr_rd, we, rst, data_in, check_rs1, check_rs2);
   end
   always @(posedge clk) begin
      #8;
      $display("%3b %3b %3b %b %b %8b | %8b %8b | %8b %8b | %s",
	       addr_rs1, addr_rs2, addr_rd, we, rst, data_in, rs1, rs2, check_rs1, check_rs2,
	       ((check_rs1 != rs1) || (check_rs2 != rs2) ? "ERROR" : ""));
      
      if ($feof(data_file)) begin
	 $display("-------------------------+-------------------+-------------------+---------");
	 $display("Cerrando archivo con datos de prueba ...");
	 $fclose(data_file);
	 $finish;
      end
   end
endmodule // banco_de_registros_tb
