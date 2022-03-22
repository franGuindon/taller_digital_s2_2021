`timescale 1ns / 1ps

module visual7segmentostop(
    sw, clk, seg, an, dp, led
);
	input         [15:0] sw;
	output         [3:0] an;
	output              dp;
	output         [15:0] led;
	input               clk;
	output        [6:0] seg;

wire [31:0] addr;
assign addr  = {sw[2], 1'b0, sw[1], 2'b00, sw[0], 3'b000};



wire [31:0] dataout; 
assign dataout = sw[15:4];
assign led = dataout;

visual7segmentos ctr(.dataout(dataout),
                     .address(addr),
                     .clk(clk),
                     .WE(sw[3]),
                     .seg(seg),
                     .an(an));


endmodule

