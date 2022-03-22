`timescale 1ns / 1ps

module offsettop(
    sw, led, clk
);
	input         [11:0] sw;
	input               clk;
	output        [15:0] led;

wire [31:0] addr;
assign addr  = {sw[11], 4'b0000, sw[10], 3'b000};
                //1              //1
wire [31:0] datain; 
assign datain = (addr != 32'h0108) ? 32'b0 : 32'bz;
assign led = datain;


offset ctr(.switch(sw[9:0]),//switches 5:2
                  .address(addr), 
                  .clk(clk),
                  .datain(datain)
                   );
   
endmodule
