`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2021 19:40:33
// Design Name: 
// Module Name: tEST3
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


module tEST3();

`include "fileread_utils.vh"
   //clk, sel_addr_dat, send, comando, dato, rst, data_in, data_out, reg_sel, wr
   reg clk, rst, BOTON, addr_data;
   reg [7:0] dato;
   reg [3:0] comando;
   wire [3:0] ctr_out;
   wire [7:0] data_out;
   reg [31:0] data_in;
    
   reg [7:0]  check_out_data;
   reg [3:0]   check_wr;

Completo3 co(
.rst(rst),.clk(clk),.botoncenter(BOTON), .switch15(addr_data),
.data_data(dato),//interrruptores
.comando_data(comando),//interruptores bin
.PMOD(data_out),
.contr_PMOD(ctr_out));

   
   parameter data = "generador_de_datos_4.dat";
   integer data_file;
   integer file_did_not_open;
   
   initial begin
      clk = 0;
      forever #35 clk = ~clk;
   end
      //clk, sel_addr_dat, send, comando, dato, rst, data_in, data_out, reg_sel, wr
   initial begin
      $display("Abriendo archivo con datos de prueba ...");
      $display("----+----------------------------+----------------------------+---------");
      $display("Ent                                   | Salidas esperadas              | Salidas            | Errores");
      $display("dato send sel_addr comando rst        | check_out      check_wr        | data_out  wr");
      $display("----+----------------------------+----------------------------+----------------------------+----------------------------+-----------");
      data_file = $fopen(data, "r");
      file_did_not_open = (data_file == 0);
      if (file_did_not_open) $finish;
   end
   
   always @(negedge clk) begin
      data_line = get_line_from_file(data_file);
      $sscanf(data_line, "%b %b %b %b %b  %b  %b",
	      addr_data, BOTON, comando, dato, data_in, rst,  check_out_data,  check_wr);
      #69
      $display("  %b  %b  %b  %b  %b    %b       %b    %b         %s",
	       addr_data, BOTON, comando, dato,data_in, rst, check_out_data,  check_wr, data_out, 
	       ((check_out_data!= data_out) || (check_wr != ctr_out)  ? "ERROR" : ""));
      
      if ($feof(data_file)) begin
     $display("----+----------------------------+----------------------------+----------------------------+----------------------------+-----------");
	 $display("Cerrando archivo con datos de prueba ...");
	 $fclose(data_file);
	 $finish;
      end
   end
endmodule // banco_de_registros_tb

