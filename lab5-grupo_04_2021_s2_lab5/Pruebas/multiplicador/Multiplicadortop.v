`timescale 1ns / 1ps

module Multiplicadortop(
    sw, led, clk
);
	input         [5:0] sw;
	input               clk;
	output        [15:0] led;

wire [31:0] addr;
assign addr  = {sw[5], 5'b00000, sw[4], 2'b00};
                //0              //1
wire [31:0] datain; 
assign datain = (addr != 32'h0104) ? 32'b0 : 32'bz;
assign led = datain;


Multiplicador ctr(.switch(sw[3:0]),//switches 5:2
                  .address(addr), 
                  .clk(clk),
                  .datain(datain)
                   );
   
endmodule
