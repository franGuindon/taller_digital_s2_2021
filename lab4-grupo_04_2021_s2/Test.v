`timescale 10ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.10.2021 20:04:12
// Design Name: 
// Module Name: Test
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


module Test();
reg in;
reg clk;
reg rst;
//reg  x;
wire [7:0] segments;
//wire [7:0] display;
wire [7:0] pins;
integer i;




initial begin
      clk = 0;
      forever #1 clk = ~clk;
   end
   
   
//completo vf(.clk(clk),.rst(rst), .Key(in),
//.o_seven_segments(display),
//.o_anode_pins(pins));

//antirebote aa(.CLK(clk),
//	.RST(rst),
//	.KEY_IN(in),
//	.KEY_FLAG(flag),
//	.KEY_STATE(salida));

debcont db(
.key(in),
.clk(clk),
.rst(rst),
.o_seven_segments(segments),
.o_anode_pins(pins)
    );
    
 initial
begin
    $display("entrada  |  anodo | segmento ",in, pins, segments);
    for (i = 0; i < 50; i = i + 1)
    begin
      if (i==0)
         begin
            rst=1;#10
            rst=0;#10
             //x= ds & salida;
            $display(" %b    |    %b |    %b  ", in, pins, segments);
         end
      else if (i==1)
         begin
            rst=1;#100
            rst=0;
            in = 1'b1; #5
            in = 1'b0; #1
            in = 1'b1; #1
            in = 1'b0; #1
             //x= ds & salida;
            $display(" %b    |    %b |    %b  ", in, pins, segments);
         end
        else if (i==2)
         begin
         rst=0;
            in = 1'b1; #5
            in = 1'b0; #2
            in = 1'b1; #3
            in = 1'b0; #2
            in = 1'b1; #1
           //x = ds & salida;
           $display(" %b    |    %b |    %b  ", in, pins, segments);
         end
        else if (i==5)
        begin
        
        in = 1'b1; #50
          // x= ds & salida;
       $display(" %b    |    %b |    %b  ", in, pins, segments);
        end
        else if (i==12)
        begin
        ;
        in = 1'b1; #50
        // x = ds & salida;
        $display(" %b    |    %b |    %b  ", in, pins, segments);
        end
        else if (i==18)
        begin
        ;
        in = 1'b1; #50
        // x = ds & salida;
        $display(" %b    |    %b |    %b  ", in, pins, segments);
        end
        else 
          begin
        
        in = 1'b0; #8
        //x= ds & salida; 
       $display(" %b    |    %b |    %b  ", in, pins, segments);
        end
    end
    $finish;
end  



endmodule
