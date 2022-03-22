`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.10.2021 19:59:09
// Design Name: 
// Module Name: trad
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module trad();
`include "fileread_utils.vh"
//   addr_rs1, addr_rs2, addr_rd, data_in1, data_in2, w1,w2, clk, rst, out1
   reg 	 clk, cont;
   reg [31:0] inst, inf;
   wire [7:0]datos;
   wire [2:0]control;
   wire listo;
   reg lss;

   Traductor tdd(
.inst(inst),
.conta(cont),
.info(inf),
.data(datos),
.control(control),
.listo(lss),
.ls(listo)
    );
   parameter data = "gnd.dat";
   integer data_file;
   integer file_did_not_open;
   integer first_run = 1;
   
   initial begin
      clk = 0;
      forever #35 clk = ~clk;
   end
   
   initial begin
      $display("Abriendo archivo con datos de prueba ...");
      $display("-------------------------+-------------------+-------------------+---------");
      $display("Entradas                | Salidas | Salidas esperadas | Errores");
      $display("w1 w2 data_in1 data_in2 |   out   |       check       |");
      $display("-------------------------+-------------------+-------------------+---------");
      data_file = $fopen(data, "r");
      file_did_not_open = (data_file == 0);
      if (file_did_not_open) $finish;
   end
   //   
   always @(negedge clk) begin
      data_line = get_line_from_file(data_file);
      $sscanf(data_line, " %b %b %b %b ",
	      lss, cont, inst, inf);
   end
   always @(posedge clk) begin
      
      if ($feof(data_file)) begin
	 $display("-------------------------+-------------------+-------------------+---------");
	 $display("Cerrando archivo con datos de prueba ...");
	 $fclose(data_file);
	 $finish;
      end
   end
endmodule
