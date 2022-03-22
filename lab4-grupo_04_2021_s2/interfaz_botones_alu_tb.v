`timescale 1ns / 1ps

module interfaz_botones_alu_tb;
`include "fileread_utils.vh"
   //clk, num_a_in, num_b_in, push, ALU_control, num_a_out,num_b_out
   reg clk;
   reg [7:0] num_a_in; // interruptores 0-7
   reg [7:0] num_b_in; // interruptores  8-15
   reg [4:0] push; // seleccion 
   wire [7:0] num_a_out;
   wire [7:0] num_b_out;
   wire [3:0] ALU_control;
   
   
   reg [3:0]  check_ALU_control;
   reg [7:0]  check_num_a_out, check_num_b_out;

   interfaz_botones_alu MDE (.clk(clk),
               .num_a_in(num_a_in),
               .num_b_in(num_b_in),
               .push(push),
			   .num_a_out(num_a_out),
			   .num_b_out(num_b_out),
			   .ALU_control(ALU_control));
   
   parameter data = "interfaz_botones_alu.dat";
   integer data_file;
   integer file_did_not_open;
   
   initial begin
      clk = 0;
      forever #35 clk = ~clk;
   end
      //clk, num_a_in, num_b_in, push, ALU_control, num_a_out,num_b_out
   initial begin
      $display("Abriendo archivo con datos de prueba ...");
      $display("----+----------------------------+----------------------------+---------");
      $display("Ent                        | Salidas                              | Salidas esperadas            | Errores");
      $display("numero a   numero b   push | numero sal a numero sal b AlU_control| check_na check_nb, check_alu");
      $display("----+----------------------------+----------------------------+----------------------------+----------------------------+-----------");
      data_file = $fopen(data, "r");
      file_did_not_open = (data_file == 0);
      if (file_did_not_open) $finish;
   end
   
   always @(negedge clk) begin
      data_line = get_line_from_file(data_file);
      $sscanf(data_line, "%h %h %b %h %h %h",
	      num_a_in, num_b_in, push, check_num_a_out, check_num_b_out, check_ALU_control);
   end
   always @(posedge clk) begin
      #10
      $display("  %h    %h    %b    %h    %h    %h      %h     %h       %h       %s",
	       num_a_in, num_b_in, push, num_a_out,num_b_out, ALU_control ,check_num_a_out, check_num_b_out, check_ALU_control,
	       ((check_num_a_out != num_a_out) || (check_num_b_out != num_b_out) || (check_ALU_control != ALU_control) ? "ERROR" : ""));
      
      if ($feof(data_file)) begin
     $display("----+----------------------------+----------------------------+----------------------------+----------------------------+-----------");
	 $display("Cerrando archivo con datos de prueba ...");
	 $fclose(data_file);
	 $finish;
      end
   end
endmodule // banco_de_registros_tb
