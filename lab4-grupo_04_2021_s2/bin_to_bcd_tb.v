`timescale 1ns / 1ps

module bin_to_bcd_tb;
`include "fileread_utils.vh"
//(bin, hundreds, tens, ones);

   parameter N = 7;
   reg  [N:0] bin;
   wire [3:0] hundreds;
   wire [3:0] tens;
   wire [3:0] ones;
   
   reg [3:0] check_hundreds;
   reg [3:0] check_tens;
   reg [3:0] check_ones;
   reg       clk;

   bin_to_bcd #(.N(N)) btbcd (.bin(bin),
               .hundreds(hundreds),
               .tens(tens),
			   .ones(ones));
   
   parameter data = "bin_to_bcd.dat";
   integer data_file;
   integer file_did_not_open;
   
   initial begin
      clk = 0;
      forever #35 clk = ~clk;
   end
   
   initial begin
      $display("Abriendo archivo con datos de prueba ...");
      $display("----+----------------------------+----------------------------+----------------------------+----------------------------+-----------");
      $display("Ent         | Salidas            | Salidas esperadas                    | Errores");
      $display("dato binario| hundreds tens ones | check hundreds check tens check ones");
      $display("----+----------------------------+----------------------------+----------------------------+----------------------------+-----------");
      data_file = $fopen(data, "r");
      file_did_not_open = (data_file == 0);
      if (file_did_not_open) $finish;
   end
   
   always @(negedge clk) begin
      data_line = get_line_from_file(data_file);
      $sscanf(data_line, "%b %b %b %b",
	      bin, check_hundreds, check_tens, check_ones);
   end
   always @(posedge clk) begin
      #10
      $display("%b    %b     %b     %b      %b     %b     %b   %s",
	       bin, hundreds, tens, ones, check_hundreds, check_tens, check_ones,
	       ((check_hundreds != hundreds) || (check_ones != ones) || (check_tens != tens) ? "ERROR" : ""));
      
      if ($feof(data_file)) begin
     $display("----+----------------------------+----------------------------+----------------------------+----------------------------+-----------");
	 $display("Cerrando archivo con datos de prueba ...");
	 $fclose(data_file);
	 $finish;
      end
   end
endmodule


