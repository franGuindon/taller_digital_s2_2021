`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.10.2021 17:33:52
// Design Name: 
// Module Name: Traductor
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Traductor(
input [31:0]inst,
input  conta,
input [31:0]info,
output reg [7:0] data,
output reg [2:0]control,
input  [1:0] listo,
output reg ls
    );

reg [7:0] dir;
reg [7:0] display;
initial ls=0;

always @ (conta,inst, info,listo)

if (conta==0) begin 
  dir <= inst[14:8] ;
  dir[7] <= 1'b1 ;
  display <= info[7:0];
  case(inst[7:4])
    
    4'h0:begin
      data<=8'b00000001;
      control<=3'b000;
      ls<=0;//enable baja para ir a display
    end

    4'h1:begin
      data<=8'b00000010;
      control<=3'b000;
      ls<=0;
    end

    4'h2:begin
      data<=8'b00000100;
      control<=3'b000;
      ls<=0;
    end

    4'h3:begin
      data<=8'b00000111;
      control<=3'b000;
      ls<=0;
    end

    4'h4:begin
      data<=8'b00001100;//set display?
      control<=3'b000;
      ls<=0;
    end

    4'h5:begin
      data<=8'b00001110;//set display?
      control<=3'b000;
      ls<=0;
    end

    4'h6: begin
      data<=8'b00001111;//set display?
      control<=3'b000;
      ls<=0;
    end

    4'h7:begin
      data<=display;//necesita recibir el dato
      control<=3'b100;
      ls<=0;
    end

    4'h8: if (listo==0) begin
      data<=dir;
      control<=3'b000;
      ls<=1;
    end
    else if (listo==1) begin
      data<=display;
      control<=3'b100;
      ls<=0;
    end

    4'h9:begin
      data<=display;//necesita recibir el dato
      control<=3'b110;
      ls<=0;
    end

    4'hA: if (listo==0) begin
      data<=dir;
      control<=3'b000;
      ls=1;
    end
    else if (listo==1) begin
      data<=display;
      control<=3'b011; 
      ls<=0;
    end

    4'hF:if (listo==0) begin
      data<=8'b00000001;
      control<=3'b000;
      ls=1;
    end
    else if (listo==1) begin
      data<=8'b00001100;//set display?
      control<=3'b000;
      ls<=1;
    end
    else if (listo==2) begin
      data<=8'b00000100;
      control<=3'b000;
      ls<=0;
    end

    4'hB: if (listo==0) begin
      data<=8'b0011_1000;
      control<=3'b000;
      ls<=1;
    end
    else if (listo==1) begin
      data<=8'b0000_1100;
      control<=3'b000;
      ls<=1;
    end
    else if (listo==2) begin
      data<=8'b0000_0001;
      control<=3'b000;
      ls<=1;
    end
    else if (listo==3) begin
      data<=8'b0000_0110;
      control<=3'b000;
      ls<=0;
    end

  endcase
end
else begin
  dir <= inst[14:8] ;
  dir[7] <= 1'b1 ;
  display <= info[8:0]; 
  data<=8'b00000000;
  control<=3'b000;
  ls<=0;
end
    
  
endmodule
