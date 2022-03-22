`timescale 1ns / 1ps

module generador_de_datos_tb;
`include "fileread_utils.vh"
   //clk, sel_addr_dat, send, comando, dato, rst, data_in, data_out, reg_sel, wr
   reg clk, rst, sel_addr_dat, send;
   reg [7:0] dato;
   reg [31:0] data_in;
   reg [3:0] comando;
   wire reg_sel, wr;
   wire [31:0] data_out;
   
   reg 	      check_reg_sel, check_wr;
   reg [31:0]  check_out;

   generador_de_datos MDE (.clk(clk),
               .sel_addr_dat(sel_addr_dat),
               .send(send),
               .comando(comando),
               .dato(dato),
			   .rst(rst),
			   .data_in(data_in),
			   .data_out(data_out),
			   .reg_sel(reg_sel),
			   .wr(wr));
   
   parameter data = "generador_de_datos.dat";
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
      $display("dato send sel_addr comando rst data_in| check_out check_reg, check_wr  | data_out reg_sel wr");
      $display("----+----------------------------+----------------------------+----------------------------+----------------------------+-----------");
      data_file = $fopen(data, "r");
      file_did_not_open = (data_file == 0);
      if (file_did_not_open) $finish;
   end
   
   always @(negedge clk) begin
      data_line = get_line_from_file(data_file);
      $sscanf(data_line, "%b %b %b %b %b %b %b %b %b",
	      sel_addr_dat, send, comando, dato, rst, data_in, check_out, check_reg_sel, check_wr);
   end
   always @(posedge clk) begin
      #10
      $display("  %b  %b  %b  %b  %b    %b      %b     %b       %b         %b       %b       %b   %s",
	       sel_addr_dat, send, comando, dato, rst, data_in, check_out, check_reg_sel, check_wr, data_out, reg_sel, wr,
	       ((check_out != data_out) || (check_wr != wr) || (check_reg_sel != reg_sel) ? "ERROR" : ""));
      
      if ($feof(data_file)) begin
     $display("----+----------------------------+----------------------------+----------------------------+----------------------------+-----------");
	 $display("Cerrando archivo con datos de prueba ...");
	 $fclose(data_file);
	 $finish;
      end
   end
endmodule // banco_de_registros_tb
