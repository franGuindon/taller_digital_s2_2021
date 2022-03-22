`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.09.2021 08:25:23
// Design Name: 
// Module Name: rom1
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


//-- Fichero: rom16x4.v
module rom1 #(DATA_WIDTH=3, parameter M=7)(input clk,
                  input wire [M:0] addr,
                output reg [DATA_WIDTH:0] data);


//-- Parametro: Nombre del fichero con el contenido de la ROM
parameter ROMFILE = "C:/Users/CHRISUS/Taller/Rom y Ram/Rom y Ram.srcs/sources_1/new/memoria.txt";


  reg [DATA_WIDTH:0] rom [0:M*2+1];


always @(posedge clk) begin
    data <= rom[addr];
  end


initial begin
  $readmemb(ROMFILE, rom);
end

endmodule

      




