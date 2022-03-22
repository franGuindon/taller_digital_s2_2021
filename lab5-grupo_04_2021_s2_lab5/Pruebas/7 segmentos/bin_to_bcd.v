`timescale 1ns / 1ps

module bin_to_bcd
(bin, thousands, hundreds, tens, ones);

   input [31:0] bin;
   output [3:0] thousands;
   output [3:0] hundreds;
   output [3:0] tens;
   output [3:0] ones;
   
   assign thousands = (bin/1000)%10;
   assign hundreds = (bin/100)%10;
   assign tens = (bin/10)%10;
   assign ones = (bin)%10;
   
endmodule

