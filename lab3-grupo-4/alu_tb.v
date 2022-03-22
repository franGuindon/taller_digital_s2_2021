`timescale 1ns / 1ps

module alu_tb;
`include "fileread_utils.vh"

   parameter n = 32;
   reg [n-1:0] ALUA, ALUB;
   reg [3:0]   ALUControl;
   reg 	       ALUFlagIn;
   wire [n-1:0] ALUResult;
   wire 	C, Z;
   reg [n-1:0] 	check_ALUResult;
   reg 		check_C, check_Z;
   reg 		clk;
   
   ALU #(.n(n)) alu (.ALUA(ALUA),
		     .ALUB(ALUB),
		     .ALUControl(ALUControl),
		     .ALUFlagIn(ALUFlagIn),
		     .ALUResult(ALUResult),
		     .C(C),
		     .Z(Z));
   
   parameter data = "alu.dat";
   integer data_file;
   integer file_did_not_open;
   
   initial begin
      clk = 0;
      forever #10 clk = ~clk;
   end
   
   initial begin
      $display("Abriendo archivo con datos de prueba ...");
      // $display("----+----------------------------+----------------------------+---------");
      // $display("Ent | Salidas                    | Salidas esperadas          | Errores");
      // $display("  r | s w   rs1   rs2    rd   op | s w   rs1   rs2    rd   op |");
      // $display("----+----------------------------+----------------------------+---------");
      data_file = $fopen(data, "r");
      file_did_not_open = (data_file == 0);
      if (file_did_not_open) $finish;
   end
   
   always @(negedge clk) begin
      data_line = get_line_from_file(data_file);
      $sscanf(data_line, "%h %h %h %h %h %h %h",
	      ALUA, ALUB, ALUControl, ALUFlagIn, check_C, check_Z, check_ALUResult);
      #10;
      $display(" %h %h %h %h %h %h %h %h %h %h | %s",
	       ALUA, ALUB, ALUControl, ALUFlagIn, C, Z, ALUResult, check_C, check_Z, check_ALUResult,
	       ((check_C != C) || (check_Z != Z) || (check_ALUResult != ALUResult) ? "ERROR" : ""));
      
      if ($feof(data_file)) begin
	 // $display("----+----------------------------+----------------------------+---------");
	 $display("Cerrando archivo con datos de prueba ...");
	 $fclose(data_file);
	 $finish;
      end
   end
endmodule // banco_de_registros_tb
