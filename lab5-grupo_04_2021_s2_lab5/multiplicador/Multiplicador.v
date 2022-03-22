`timescale 1ns / 1ps

module Multiplicador(
   input [3:0]switch,//switches 5:2
   input [31:0]address, 
   input clk,
   output [31:0] datain
       );
//reg clkdiv = 0;
//integer i = 0;
assign datain = (address == 32'h0104) ? switch : 32'bz;

//localparam st_Idle = 0;
//localparam st_Presionado = 1;

//reg [1:0] estado = st_Idle;
/*
 always @( posedge clk ) begin

   case (estado)

      st_Idle: begin
         if (address == 4'h0104) estado <= st_Presionado;
            datain<= switch;
            clkdiv <= 0;
         end

      st_Presionado: begin
           clkdiv <= 1;
           if ( i < 50_000_000 ) i = i + 1;
           else begin
              i = 0;
              datain = 4'b0;
              estado <= st_Idle;
             end
           end

      endcase
   end
  */  
   
endmodule
