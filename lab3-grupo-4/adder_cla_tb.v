`timescale 1ns / 1ps

module maquina_de_estados_tb;
`include "fileread_utils.vh"
   
   reg [3:0] A, B;
   reg       Cin;
   wire [3:0] S;
   wire	      Cout;
   reg [3:0]  check_S;
   reg 	      check_Cout;
   reg 	      clk;
   

   CLA_4bit adder (.S(S), .Cout(Cout), .A(A), .B(B), .Cin(Cin));
   
   parameter data = "adder_cla.dat";
   integer data_file;
   integer file_did_not_open;
   
   initial begin
      clk = 0;
      forever #5 clk = ~clk;
   end
   
   initial begin
      $display("Abriendo archivo con datos de prueba ...");
      $display("-------------+---------+---------+---------");
      $display("Entradas     | Salidas | Sal.esp.| Errores");
      $display("Ci    A    B | Co    S | Co    S |");
      $display("-------------+---------+---------+---------");
      data_file = $fopen(data, "r");
      file_did_not_open = (data_file == 0);
      if (file_did_not_open) $finish;
   end
   
   always @(negedge clk) begin
      data_line = get_line_from_file(data_file);
      $sscanf(data_line, "%b %b %b %b %b", Cin, A, B, check_Cout, check_S);
      #9
      $display(" %b %b %b |  %b %b |  %b %b | %s",
	       Cin, A, B, Cout, S, check_Cout, check_S,
	       ((check_S != S) || (check_Cout != Cout) ? "ERROR" : ""));
      
      if ($feof(data_file)) begin
	 $display("-------------+---------+---------+---------");
	 $display("Cerrando archivo con datos de prueba ...");
	 $fclose(data_file);
	 $finish;
      end
   end
endmodule // banco_de_registros_tb
