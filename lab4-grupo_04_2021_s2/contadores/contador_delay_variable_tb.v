`timescale 1ns / 1ps

module contador_delay_variable_tb;
`include "../fileread_utils.vh"
   
   reg clk = 0;
   reg rst = 0;
   reg [31:0] delay_cycles = 0;
   wire [1:0] count;
   reg [1:0] check_count = 0;

    ContadorDelayVariable #(
        .COUNTER_WIDTH(2)
    ) CDV (
      .clk(clk),
      .rst(rst),
      .i_delay_cycles(delay_cycles),
      .o_count(count));
   
   parameter data = "contador_delay_variable.dat";
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
        $sscanf(data_line, "%b %d %b", rst, delay_cycles, check_count);
        #199;
        $display(
            "%b %d | %b | %b | %s",
            rst, delay_cycles, count, check_count,
            (count != check_count ? "ERROR" : "")
        );
        if ($feof(data_file)) begin
        // $display("----+----------------------------+----------------------------+---------");
        $display("Cerrando archivo con datos de prueba ...");
        $fclose(data_file);
        $finish;
        end
    end
endmodule // banco_de_registros_tb
