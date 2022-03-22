`timescale 1ns / 1ps

module TopUnidadDeControl(
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

    // útil para el micro
    // reg [31:0] instruction_bank [0:12] = {
    //     32'b
    // };

    // wire [31:0] instruction;
    // wire [3:0] inst_id;

    // assign inst_id = sw[3:0];
    // assign instruction = instruction_bank[inst_id];

    wire [31:0] instruction;
    wire reset;
    wire equal;
    wire [6:0] funct7;
    wire [2:0] funct3;
    wire [6:0] opcode;

    assign reset = sw[15];
    assign equal = sw[14];
    assign funct7 = sw[13] == 1'b1 ? 7'b010_0000 : 7'b000_0000;
    assign funct3 = sw[9:7];
    assign opcode = sw[6:0];
    assign instruction = {
        funct7, 10'b0_0000_0000_0, funct3, 5'b0000_0, opcode
    };

    wire [1:0] imm_sel;
    wire datoA_sel;
    wire datoB_sel;
    wire [3:0] ALU_control;
    wire dato_rd_sel;
    wire WE;
    wire [1:0] PC_sel;
    wire WE_banco_de_registros;
    wire [2:0] debug;

    assign led[15:14] = imm_sel;
    assign led[13] = datoA_sel;
    assign led[12] = datoB_sel;
    assign led[11:8] = ALU_control;
    assign led[7] = dato_rd_sel;
    assign led[6] = WE;
    assign led[5:4] = PC_sel;
    assign led[3] = WE_banco_de_registros;
    assign led[2:0] = debug;

    UnidadDeControl udc (
        clkdiv,
        instruction,
        equal,
        reset,
        imm_sel,
        datoA_sel,
        datoB_sel,
        ALU_control,
        dato_rd_sel,
        WE,
        PC_sel,
        WE_banco_de_registros,
        debug
    );

endmodule