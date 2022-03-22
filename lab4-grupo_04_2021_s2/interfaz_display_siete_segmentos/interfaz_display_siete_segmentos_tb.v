`timescale 1ns / 1ps

module interfaz_display_siete_segmentos_tb;
`include "../fileread_utils.vh"
   
   reg clk = 0;
   reg [15:0] bin_data = 0;
   wire [7:0] led_data;
   wire [3:0] anode_data;
   reg [7:0] check_led_data = 0;
   reg [3:0] check_anode_data = 0;

   InterfazDisplaySieteSegmentos #(
      .CYCLES_PER_DISPLAY(1)
   ) IDSS (
      .clk(clk),
      .i_binary_coded_value(bin_data),
      .o_seven_segments(led_data),
      .o_anode_pins(anode_data)
   );
   
   parameter data = "interfaz_display_siete_segmentos.dat";
   integer data_file;
   integer file_did_not_open;
   
   initial forever #100 clk = ~clk;
   
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
   
   always @ ( negedge clk ) begin
      data_line = get_line_from_file(data_file);
      $sscanf(data_line, "%h %b %b", bin_data, check_led_data, check_anode_data);
      #199;
      $display("%h | %b %b | %b %b | %s",
               bin_data, led_data, anode_data, check_led_data, check_anode_data,
               ((led_data != check_led_data) || (anode_data != check_anode_data) ?
               "ERROR" : ""));
      
      if ($feof(data_file)) begin
         // $display("----+----------------------------+----------------------------+---------");
         $display("Cerrando archivo con datos de prueba ...");
         $fclose(data_file);
         $finish;
      end
   end
endmodule // banco_de_registros_tb
