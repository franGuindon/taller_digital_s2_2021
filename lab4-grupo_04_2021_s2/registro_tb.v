`timescale 1ns / 1ps

module banco_de_registros_tb;
`include "fileread_utils.vh"
//   addr_rs1, addr_rs2, addr_rd, data_in1, data_in2, w1,w2, clk, rst, out1
   parameter M=32;
   reg 	       w1, w2, clk, rst;
   reg [M-1:0] data_in1, data_in2;
   wire [M-1:0] out1;
   reg [M-1:0] 	check_out;

   banco_de_registros #(.M(M)) BDR (
					   .data_in1(data_in1),
					   .data_in2(data_in2),
					   .w1(w1),
					   .w2(w2),
					   .clk(clk),
					   .rst(rst),
					   .out1(out1));
   
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
      $display("Entradas                    | Salidas | Salidas esperadas | Errores");
      $display("w1 w2 rst data_in1 data_in2 |   out   |       check       |");
      $display("-------------------------+-------------------+-------------------+---------");
      data_file = $fopen(data, "r");
      file_did_not_open = (data_file == 0);
      if (file_did_not_open) $finish;
   end
   //   addr_rs1, addr_rs2, addr_rd, data_in1, data_in2, w1,w2, clk, rst, out1
   always @(negedge clk) begin
      data_line = get_line_from_file(data_file);
      $sscanf(data_line, " %b %b %b %b %b %b",
	      w1, w2, rst, data_in1, data_in2, check_out);
   end
   always @(posedge clk) begin
      #10;
      $display("%b  %b   %b  %8b  %8b %8b  %8b   %s",
	       w1, w2, rst, data_in1, data_in2, out1, check_out,
	       ((check_out != out1) ? "ERROR" : ""));
      
      if ($feof(data_file)) begin
	 $display("-------------------------+-------------------+-------------------+---------");
	 $display("Cerrando archivo con datos de prueba ...");
	 $fclose(data_file);
	 $finish;
      end
   end
endmodule // banco_de_registros_tb
