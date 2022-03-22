`timescale 1ns / 1ps

module registro_pipo_tb;
`include "../fileread_utils.vh"
   parameter N = 16;
   reg we;
   reg clk;
   reg rst;
   reg [N-1:0] i_data;
   wire [N-1:0] o_data;
   reg [N-1:0] check_o_data;

   RegistroPIPO #(.REGISTER_WIDTH(N)) R (
         .we(we), .clk(clk), .rst(rst),
         .i_data(i_data), .o_data(o_data)
      );
   
   parameter data = "registro_pipo.dat";
   integer data_file;
   integer file_did_not_open;
   
   initial begin
      clk = 0;
      forever #50 clk = ~clk;
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
      $sscanf(data_line, "%b %b %h %h", we, rst, i_data, check_o_data);
      #99;
      $display("%b %b %h | %h | %h | %s",
	       we, rst, i_data, o_data, check_o_data,
	       ((o_data != check_o_data) ? "ERROR" : ""));
      
      if ($feof(data_file)) begin
	 // $display("----+----------------------------+----------------------------+---------");
	 $display("Cerrando archivo con datos de prueba ...");
	 $fclose(data_file);
	 $finish;
      end
   end
endmodule // banco_de_registros_tb
