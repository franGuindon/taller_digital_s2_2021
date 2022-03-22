`timescale 1ns / 100ps

module ALU
  #(parameter n=4)(input [n-1:0] ALUA, ALUB,
		   input [3:0] 	  ALUControl,
		   input 	  ALUFlagIn,
		   output [n-1:0] ALUResult,
		   output 	  C, Z
		   );
   wire [n-1:0] 		  B;
   wire [n:0] 			  temp;
   wire [n-1:0] 		  S;
   wire 			  Cout;

   wire [n/4 - 2: 0] 		  carries;
   CLA_4bit adder [n/4 - 1:0] (.S(S), .Cout({Cout, carries}), .A(ALUA), .B(B), .Cin({carries,ALUFlagIn}));
   
   assign B = ALUControl == 4'h2 ? ALUB :
	      ALUControl == 4'h6 ? ~ALUB + 1 : 0;
   assign temp = ALUControl == 4'h8 ? (ALUFlagIn == 0 ? ALUA << ALUB : ~((~ALUA) << ALUB)) :
		 ALUControl == 4'h9 ? (ALUFlagIn == 0 ?
				       (ALUB != 0 ? ALUA >> (ALUB-1) : {ALUA, 1'b0}) :
				       (ALUB != 0 ? ~{~ALUA >> (ALUB-1)} : {ALUA, 1'b0})):
		 0 ;
   assign C = ALUControl == 4'h8 ? temp[n] :
	      ALUControl == 4'h9 ? temp[0] :
	      0 ;
   assign ALUResult = ALUControl == 4'h0 ? ALUA & ALUB :
		      ALUControl == 4'h1 ? ALUA | ALUB :
		      ALUControl == 4'h2 ? S :
		      ALUControl == 4'h3 ? (ALUFlagIn == 0 ? ALUA+1: ALUB+1) :
		      ALUControl == 4'h4 ? (ALUFlagIn == 0 ? ALUA-1: ALUB-1) :
		      ALUControl == 4'h5 ? (ALUFlagIn == 0 ? ~ALUA : ~ALUB) :
		      ALUControl == 4'h6 ? S :
		      ALUControl == 4'h7 ? ALUA ^ ALUB :
		      ALUControl == 4'h8 ? temp[n-1:0] :
		      ALUControl == 4'h9 ? temp[n:1] :
		      0 ;
   assign Z = (ALUResult == 0 ? 1 : 0);
endmodule // ALU
