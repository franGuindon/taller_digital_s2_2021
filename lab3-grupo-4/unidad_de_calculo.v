`timescale 1 ns / 1 ps
`include "LFSR/LFSR.v"
`include "maquina_de_estados.v"
`include "banco_de_registros.v"
`include "alu.v"

module unidad_de_calculo #(parameter N=32)
   (rst, clk, modo, estado, sel, we, addr_rs1, addr_rs2, addr_rd, op, reg_file);
   
   input rst, clk;
   output modo;
   output [3:0] estado;
   output sel, we;
   output [4:0] addr_rs1, addr_rs2, addr_rd;
   output [3:0] op;
   output [N*N-1:0] reg_file; 
   
   wire [3:0] ALUControl;
   wire [N-1:0] LFSR_out, ALUA, ALUB, ALU_out, mux_out;

   assign mux_out = !sel ? LFSR_out : ALU_out;
   
   LFSR #(.NUM_BITS(N)) LFSR_inst (.i_Clk(~clk), .i_Enable(~rst), .o_LFSR_Data(LFSR_out));
   
   maquina_de_estados MDE (.clk(~clk),
			   .rst(rst),
			   .sel(sel),
			   .we(we),
			   .addr_rs1(addr_rs1),
			   .addr_rs2(addr_rs2),
			   .addr_rd(addr_rd),
			   .op(ALUControl));
   
   banco_de_registros #(.N(5), .M(N)) BDR (.addr_rs1(addr_rs1),
					   .addr_rs2(addr_rs2),
					   .addr_rd(addr_rd),
					   .data_in(mux_out),
					   .we(we),
					   .clk(clk),
					   .rst(rst),
					   .rs1(ALUA),
					   .rs2(ALUB));
   
   ALU #(.n(N)) ALU_inst (.ALUA(ALUA),
			  .ALUB(ALUB),
			  .ALUControl(ALUControl),
			  .ALUFlagIn(1'b0),
			  .ALUResult(ALU_out));

   assign modo = MDE.modo;
   assign estado = MDE.estado;
   assign op = ALUControl;

   generate
      genvar i;
      for (i = 0; i < N; i = i + 1) begin
	 assign reg_file[i*N +: N] = BDR._banco_de_registros[i];
      end
   endgenerate
   
endmodule // unidad_de_calculo
