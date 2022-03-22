`timescale 1ns / 1ps

module ProgramCounter_tb;

`include "fileread_utils.vh"

    parameter N=4;
    reg  [N-1:0] jumpDir;
    wire [N-1:0] PC_o; 
    wire [N-1:0] PC_Inc;
    reg clk;
    wire jumpFlag;
    reg  [1:0] sel;
    reg [N-1:0] 	check_pco;
    reg [N-1:0] check_pcinc;
    reg 	check_jmp;

   parameter data = "PC.txt";
   integer data_file;
   
   reg [MAX_CHARS*8-1:0] data_line;
   
   initial begin
      clk = 0;
      forever #25 clk = ~clk;
   end

   ProgramCounter #(N) PooC (.jumpDir(jumpDir), .PC_o(PC_o), .clk(clk), .jumpFlag(jumpFlag), .sel(sel), .PC_Inc(PC_Inc));
   
   initial begin
      $display("Abriendo archivo con datos de prueba ...");
      $display("   Entradas    |              Salidas             |         Salidas esperadas         | Errores");
      $display("sel	|  jumpdir | jumpFlag |   PC_o    |   PC_Inc  | jumpFlag |    PC_o   |   PC_Inc   |");
      $display("-------------------------------------------------------------------------------------------------");
      data_file = $fopen(data, "r");
      if (data_file == 0) $finish;
   end
   
   always @(negedge clk) begin
   
      data_line = get_line_from_file(data_file);
      $sscanf(data_line, "%b %b %b %b %b",
	      sel, jumpDir, check_jmp, check_pco, check_pcinc);
      #50;

      $display( "%b  |   %b   |    %b     |    %b   |    %b   |     %b    |    %b   |    %b    | %s",
	       sel, jumpDir, jumpFlag, PC_o, PC_Inc, check_jmp, check_pco, check_pcinc,
	       ((((check_jmp != jumpFlag) || (check_pco != PC_o) || (check_pcinc != PC_Inc))) ? "ERROR" : ""));
      if ($feof(data_file)) begin
	 $display("-------------------------------------------------------------------------------------------------");
	 $display("Cerrando archivo con datos de prueba ...");
	 $fclose(data_file);
	 $finish;
      end
   end
endmodule 
