`timescale 1ns / 1ps

module visualizacion_led_top (
    sw, led, clk
);
	input         [15:0] sw;
	input               clk;
	output        [15:0] led;

wire [31:0] addr;
assign addr  = {sw[1], 1'b0, sw[0], 6'b0000};
                
visualizacion_led ctr(.led(led),
                      .address(addr), 
                      .clk(clk),
                      .data_out(sw[15:3]),
                      .WE(sw[2])
                       );

endmodule
