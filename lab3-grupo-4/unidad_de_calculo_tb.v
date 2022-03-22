`timescale 1ns / 1ps

module unidad_de_calculo_tb;
`include "fileread_utils.vh"

   parameter bit_width = 32;
   reg clk, rst;
   wire modo;
   wire [3:0] estado;
   wire sel, we;
   wire [4:0] addr_rs1, addr_rs2, addr_rd;
   wire [3:0] op;
   wire [bit_width*bit_width-1:0] reg_file;
   
   
   unidad_de_calculo UDC (.rst(rst), 
			  .clk(clk),
			  .modo(modo),
			  .estado(estado),
			  .sel(sel),
			  .we(we),
			  .addr_rs1(addr_rs1),
			  .addr_rs2(addr_rs2),
			  .addr_rd(addr_rd),
			  .op(op),
			  .reg_file(reg_file));
   
   parameter hex_reg_str_width = bit_width/4;
   parameter single_space_width = 1;
   parameter num_of_regs = 21;
   parameter reg_file_str_width = (single_space_width + hex_reg_str_width)*num_of_regs*8;
   parameter sep_width = single_space_width*2*8;
   
   function automatic [reg_file_str_width + sep_width -1:0] get_register_file_string;
      input [bit_width*bit_width-1:0] reg_file_;
      integer i;
      reg [hex_reg_str_width*8-1:0] register_word_buffer;
      begin
	 for (i = 0; i < 11; i = i + 1) begin
	    $sformat(register_word_buffer, "%h", reg_file_[i*bit_width +: bit_width]);
	    get_register_file_string = {get_register_file_string, " ", register_word_buffer};
	 end
	 get_register_file_string = {get_register_file_string, " |"};
	 for (i = 'h14; i < 'h14 + 10; i = i + 1) begin
	    $sformat(register_word_buffer, "%h", reg_file_[i*bit_width +: bit_width]);
	    get_register_file_string = {get_register_file_string, " ", register_word_buffer};
	 end
      end
   endfunction // get_register_file_string
   
   parameter data = "unidad_de_calculo.dat";
   integer data_file;
   integer file_did_not_open;
   reg [MAX_CHARS*8-1:0] data_line;
   
   initial begin
      clk = 0;
      forever #40 clk = ~clk;
   end
   
   initial begin
      $display("Abriendo archivo con datos de prueba ...");
      $display("--+--------+----------------+%s+%s+", {{11{9{"-"}}}, "-"}, {{10{9{"-"}}}, "-"});
      $display("  | MDE    | Salida control | Registros relevantes");
      $display("r | estado | s w a1 a2 ad o | %8s %8s %8s %8s %8s %8s %8s %8s %8s %8s %8s | %8s %8s %8s %8s %8s %8s %8s %8s %8s %8s |",
	       "reg_0", "reg_1", "reg_2", "reg_3", "reg_4", "reg_5",
	       "reg_6", "reg_7", "reg_8", "reg_9", "reg_A",
	       "reg_14", "reg_15", "reg_16", "reg_17", "reg_18",
	       "reg_19", "reg_1A", "reg_1B", "reg_1C", "reg_1D");
      $display("--+--------+----------------+%s+%s+", {{11{9{"-"}}}, "-"}, {{10{9{"-"}}}, "-"});
      data_file = $fopen(data, "r");
      file_did_not_open = (data_file == 0);
      if (file_did_not_open) $finish;
   end

   initial begin
      #60; // esperar hasta mitad de semiciclo alto
      forever begin
	 data_line = get_line_from_file(data_file);
	 $sscanf(data_line, "%b",rst);
	 #75; // esperar que pase flanco negativo y positivo
	 $display("%h | %b %b | %b %b %h %h %h %h |%s |",
		  rst, modo, estado, sel, we, addr_rs1, addr_rs2, addr_rd, op,
		  get_register_file_string(reg_file));
	 
	 if ($feof(data_file)) begin
	    $display("--+--------+----------------+%s+%s+", {{11{9{"-"}}}, "-"}, {{10{9{"-"}}}, "-"});
	    $display("Cerrando archivo con datos de prueba ...");
	    $fclose(data_file);
	    $finish;
	 end
	 #5;
      end // forever begin
   end // initial begin
endmodule // banco_de_registros_tb
