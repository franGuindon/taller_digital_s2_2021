`timescale 1ns / 1ps

module TopRAM(
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
    
    wire [31:0] douta;
    wire [31:0] addra;
    wire [31:0] dina;
    wire rst;
    wire wea;
    
    assign led [15:0] = douta[15:0];
    assign addra [31:0] = 32'b0 | sw[5:0];
    assign dina = 32'b0 | sw[13:6];
    assign rst = sw[15];
    assign wea = sw[14];

    RAM_inst RAM (
        douta,
        dina,
        addra,
        clkdiv,
        rst,
        wea
    );

endmodule