`timescale 10ns / 100ps

module InterfazDisplay (
    input clk,
    output reg [3:0] control,
    output reg [7:0] data);

    initial control = 4'b0000;
    initial data = 8'b0000_0000;
    
    

endmodule