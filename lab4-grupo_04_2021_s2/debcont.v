`timescale 10ns / 100ps


module debcont(
input key,
input clk,
input rst,
output  [7:0] o_seven_segments,
output  [3:0] o_anode_pins
    );
wire enable;
wire [7:0] cuenta;
wire slow;
wire reset;

     
    	
    debouncingpush dd(.clk(clk),.key(key),.led(enable));
    
    debouncingpush rr(.clk(clk),.key(rst),.led(reset));
    
    contadorPrueba prueb(.clk(clk), .rst(reset), .EN(enable), .conta(cuenta));
    
    InterfazDisplaySieteSegmentos uu(.clk(clk), 
    .i_binary_coded_value({8'b0,cuenta}), 
    .o_seven_segments(o_seven_segments), .o_anode_pins(o_anode_pins));    

endmodule
