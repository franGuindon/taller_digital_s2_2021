`timescale 1ns / 1ps

module TopSensor(
    input [15:0] sw,
    input btnC,
    input clk,
    input [7:0] JXADC,
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
    
    wire [31:0] address;
    wire [31:0] data_in;

    assign address [31:0] = 32'b0 | sw[15:0];
    assign led [15:0] = data_in[15:0];
    assign data_in = address != 32'h0100 ? 32'hAAAA_AAAA : 32'bz;

    sensor ADC (
        clk,
        JXADC,
        address,
        data_in
    );

endmodule