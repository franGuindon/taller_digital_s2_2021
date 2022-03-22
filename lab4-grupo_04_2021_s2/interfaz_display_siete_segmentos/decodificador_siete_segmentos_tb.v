`timescale 1ns / 1ps

module decodificador_siete_segmentos_tb;
`include "../fileread_utils.vh"
   
   reg [3:0] bin_data;
   wire [7:0] led_data;
   reg [7:0] 	check_led_data;
   reg 		clk;

   DecodificadorSieteSegmentos DSS (.i_binary_coded_value(bin_data),
				    .o_seven_segments(led_data));
   
   parameter data = "decodificador_siete_segmentos.dat";
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
      $sscanf(data_line, "%h %b", bin_data, check_led_data);
      #10;
      $display("%h %b | %b | %s",
	       bin_data, led_data, check_led_data,
	       ((led_data != check_led_data) ? "ERROR" : ""));
      
      if ($feof(data_file)) begin
	 // $display("----+----------------------------+----------------------------+---------");
	 $display("Cerrando archivo con datos de prueba ...");
	 $fclose(data_file);
	 $finish;
      end
   end
endmodule // banco_de_registros_tb
