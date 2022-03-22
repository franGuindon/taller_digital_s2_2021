//////////////////////////////////////////////////////////////////////////////
// File downloaded from http://www.nandland.com
///////////////////////////////////////////////////////////////////////////////
// Description: Simple Testbench for LFSR.v.  Set c_NUM_BITS to different
// values to verify operation of LFSR
///////////////////////////////////////////////////////////////////////////////
`timescale 1ns/10ps

module LFSR_TB ();
 
  parameter c_NUM_BITS = 16;
   
  reg r_Clk = 1'b0;
  reg r_Rst;
   
  wire [c_NUM_BITS-1:0] w_LFSR_Data;
   
  LFSR #(.NUM_BITS(c_NUM_BITS)) LFSR_inst
         (.i_Clk(r_Clk),
          .i_Enable(~r_Rst),
          .o_LFSR_Data(w_LFSR_Data)
          );
          
  initial
  begin
    r_Rst = 1'b1;
    #20
    r_Rst = 1'b0;
  end
  
  always @(*)
    #10 r_Clk <= ~r_Clk; 
   
endmodule // LFSR_TB
