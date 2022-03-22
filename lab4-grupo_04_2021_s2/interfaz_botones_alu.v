`timescale 1ns / 1ps

module interfaz_botones_alu
(clk, num_a_in, num_b_in, push, ALU_control, num_a_out,num_b_out);

   input clk;
   input [7:0] num_a_in; // interruptores 0-7
   input [7:0] num_b_in; // interruptores  8-15
   input [4:0] push; // seleccion 
   output reg [7:0] num_a_out;
   output reg [7:0] num_b_out;
   output reg [3:0] ALU_control;
   
   reg [3:0] alu_comando;
  
   always @ (posedge clk) begin

	   if (push[0]) alu_comando=4'h2; //boton arriba/suma	         	         
	   if (push[1]) alu_comando=4'h6; //boton abajo/resta
	   if (push[2]) alu_comando=4'h0; //boton izq/AND             
	   if (push[3]) alu_comando=4'h1; //boton dere/OR	        
	   if (push[4]) alu_comando=4'hA; //boton central/clear display
       
       ALU_control=alu_comando;
       num_a_out=num_a_in;
       num_b_out=num_b_in;
   end
       //assign ALU_control=alu_comando;
       //assign num_a_out=num_a_in;//agregar debouncing
       //assign num_b_out=num_b_in;
endmodule

