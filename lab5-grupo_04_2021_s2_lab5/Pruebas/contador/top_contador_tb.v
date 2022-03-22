`timescale 1ns / 1ps

module TopContador(
    input [15:0] sw,
    input btnC,
    input clk,
    output [15:0] led
);

    reg clkdiv = 0;
    integer i = 0;

    localparam st_Idle = 0;
    localparam st_Presionado = 1;

    reg [1:0] estado = st_Idle;

    always @( posedge clk ) begin

        case (estado)

            st_Idle: begin
                if (btnC == 1) estado <= st_Presionado;
                clkdiv <= 0;
            end

            st_Presionado: begin
                clkdiv <= 1;
                if ( i < 50_000_000 ) i = i + 1;
                else begin
                    i = 0;
                    estado <= st_Idle;
                end
            end

        endcase
    end
    
    wire rst;
    wire [1:0] sw_contador;
    wire [31:0] Dataout;
    wire [31:0] address;
    wire [31:0] Datain;

    assign rst = sw[15];
    assign sw_contador = sw[1:0];
    assign Dataout = sw[3:2];
    assign address = sw[13:4];
    assign Datain = (address != 32'h10C) ? 32'hAAAA_AAAA: 32'bz;
    assign led = Datain[15:0];

    Contador cntr (
        clk,
        rst,
        sw_contador,
        Dataout,
        address,
        clkdiv,
        Datain
    );

endmodule