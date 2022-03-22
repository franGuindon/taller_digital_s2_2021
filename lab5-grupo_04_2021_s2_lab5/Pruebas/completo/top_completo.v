`timescale 1ns / 1ps

module TopCompleto(
    input [15:0] sw,
    input btnC,
    input clk,
    input [7:0] JXADC,
    output [15:0] led,
    output [6:0] seg,
    output [3:0] an,
    output dp
);

    reg clkdiv = 0;
    integer i = 0;

    localparam st_Idle = 0;
    localparam st_Presionado = 1;

    reg [1:0] estado = st_Idle;

    always @( posedge clk ) begin
        if ( i < 10_000_00) i = i + 1;
        else begin
            i = 0;
            clkdiv = ~clkdiv;
        end
        // case (estado)

        //     st_Idle: begin
        //         if (btnC == 1) estado <= st_Presionado;
        //         clkdiv <= 0;
        //     end

        //     st_Presionado: begin
        //         clkdiv <= 1;
        //         if ( i < 50_000_000 ) i = i + 1;
        //         else begin
        //             i = 0;
        //             estado <= st_Idle;
        //         end
        //     end

        // endcase
    end

    wire reset;
    wire [15:0] sw_;
    wire [15:0] led_;
    wire [31:0] i_debug;
    wire [31:0] o_debug;

    assign reset = 1'b0;

    //assign sw_[5:2] = 4'b1010;
    //assign sw_[15:6] = 7'b1100100;
    assign sw_[5:2] = sw[5:2];
    assign sw_[15:6] = sw[15:6];

    //assign i_debug[15:0] = sw[15:0];

    //assign led[15:0] = o_debug[15:0];
    assign led[15:0] = led_;

    Completo comp (
        clkdiv,
        reset,
        sw_,
        JXADC,
        led_,
        seg,
        an,
        dp,
        

        i_debug,
        o_debug
    );

endmodule