`timescale 1ns / 1ps

module TopBancoDeRegistros(
    input [15:0] sw,
    input btnC, btnD,
    input clk,
    output [15:0] led
);

    reg clkdiv = 0;
    integer i = 0;

    always @( posedge clk ) begin
        if ( i < 100_000_000 ) begin
            i = i + 1;
        end
        else begin
            i = 0;
            clkdiv = ~clkdiv;
        end
    end

    wire we;
    wire rst;
    wire [3:0] addr_rs1;
    wire [3:0] addr_rs2;
    wire [3:0] addr_rd;
    wire [3:0] data_in;
    wire [3:0] rs1;
    wire [3:0] rs2;

    assign we = btnC;
    assign rst = btnD;
    assign addr_rs1 = sw[15:12];
    assign addr_rs2 = sw[11:8];
    assign addr_rd = sw[7:4];
    assign data_in = sw[3:0];
    
    assign led[15:12] = rs1;
    assign led[11:8] = rs2;
    assign led[7:0] = 8'b0;

    banco_de_registros #(.N(4), .M(4)) bdr (
        addr_rs1, addr_rs2, addr_rd,
        data_in, we, clkdiv, rst, rs1, rs2
    );

endmodule