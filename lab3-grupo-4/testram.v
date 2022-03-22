`timescale 1ns / 1ps


module testRAM();
parameter N=3;
parameter M=7;
reg [M:0]  address;
reg WE;
reg clk;
wire [N:0]  dataout;
  
ROMTORAM ram(
.addr(address),
.WE(WE), 
.clk(clk),
.q(dataout));

initial
begin 
    clk = 0;
   forever #50 clk = ~clk;
end
   
initial
begin 
 WE=1;
$display("Contents of Mem after reading data file:");
    for (address='b0; address<'b10000; address=address+1'd1)
     #100;
     $display("%d:%b",address,dataout);
#10;   
 WE=0;
$display("Contents of Mem after reading data file:");
    for (address='b0; address<'b10000; address=address+1'd1)
     #100;
     $display("%d:%b",address,dataout);
end
endmodule
