`timescale 10ns / 100ps

module TraductorAluDisplay(
    input clk,
    input [3:0] ALUControl,
    input [8:0] ALUResult,
    input [7:0] ALUA,
    input [7:0] ALUB,
    input [31:0] i_regs_display,
    output WR,
    output Reg_sel,
    output [31:0] o_regs_display);

    initial WR = 1'b0;
    initial Reg_sel = 1'b0;
    initial o_regs_display = 32'b0;
    
    parameter RDY = 1'b1;

    parameter [31:0] tabla_de_ops [0:10] = {
        32'b00100110, 32'b01111100, 32'b00101011, 32'b00000000,
        32'b00000000, 32'b00000000, 32'b00101101, 32'b00000000,
        32'b00000000, 32'b00000000, 32'b00000000
    }

    parameter st_InactivoHastaComandoNuevo = 8'h00;
    parameter st_ArmarSecuenciaDatos = 8'h01;
    parameter st_ProgramarDato = 8'h02;
    parameter st_ProgramarControl = 8'h03;
    parameter st_EsperarHastaCompletarProgramacion = 8'h04;
    parameter st_DecisionFaltanComandos = 8'h05;

    reg [7:0] estado = st_InactivoHastaComandoNuevo;

    reg [31:0] secuencia_de_datos [0:10] = {
        32'b0, 32'b0, 32'b0, 32'b0, 32'b0, 32'b0,
        32'b0, 32'b0, 32'b0, 32'b0, 32'b0,
    }

    reg [3:0] contador_dato = 4'b0;

    reg comando_cambio = 1'b0;
    
    always @ (ALUControl) begin
        comando_cambio <= 1'b1;
    end

    wire [7:0] hundreds_ALUA;
    wire [7:0] tens_ALUA;
    wire [7:0] ones_ALUA;
    wire [7:0] hundreds_ALUB;
    wire [7:0] tens_ALUB;
    wire [7:0] ones_ALUB;
    wire [8:0] hundreds_ALUResult;
    wire [8:0] tens_ALUResult;
    wire [8:0] ones_ALUResult;

    bin_to_bcd #(7) para_ALUA (ALUA, hundreds_ALUA, tens_ALUA, ones_ALUA);
    bin_to_bcd #(7) para_ALUB (ALUB, hundreds_ALUB, tens_ALUB, ones_ALUB);
    bin_to_bcd #(7) para_ALUResult (
        ALUResult, hundreds_ALUResult, tens_ALUResult, ones_ALUResult);

    always @ (posedge clk) begin
        case (estado)

            st_InactivoHastaComandoNuevo: begin
                if (comando_cambio == 1'b1) begin
                    estado <= st_ArmarSecuenciaDatos;
                    comando_cambio <= 1'b0;
                end
            end
            
            st_ArmarSecuenciaDatos: begin
                secuencia_de_datos <= {
                    {28'b0011,hundreds_ALUA},
                    {28'b0011,tens_ALUA},
                    {28'b0011,ones_ALUA},
                    tabla_de_ops[ALUControl],
                    {28'b0011,hundreds_ALUB},
                    {28'b0011,tens_ALUB},
                    {28'b0011,ones_ALuB},
                    32'b00111101,
                    {28'b0011,hundreds_ALUResult},
                    {28'b0011,tens_ALUResult},
                    {28'b0011,ones_ALUResult},
                }
                contador_dato <= 4'b0;
                estado <= st_ProgramarDato;
            end

            st_ProgramarDato: begin
                Reg_sel <= 1'b1;
                WR <= 1'b1;
                o_regs_display <= secuencia_de_datos[contador_dato];
                estado <= st_ProgramarControl;
            end

            st_ProgramarControl: begin
                Reg_sel <= 1'b0;
                WR <= 1'b1;
                if (ALUControl == 4'hA) begin
                    o_regs_display <= 32'b2;
                end
                else begin
                    o_regs_display <= {20'b0,contador_dato,4'h8,4'h2};
                end
                estado <= st_EsperarHastaCompletarProgramacion;
            end

            st_EsperarHastaCompletarProgramacion: begin
                WR <= 1'b0;
                Reg_sel <= 1'b0;
                if (i_regs_display[RDY] == 1'b1) begin
                    estado <= st_DecisionFaltanComandos;
                end
            end

            st_DecisionFaltanComandos: begin
                if (ALUControl == 4'hA begin
                    estado <= st_InactivoHastaComandoNuevo;
                end
                else if (contador_dato < 11) begin
                    contador_dato <= contador_dato + 1;
                    estado <= st_ProgramarDato;
                end
                else begin
                    estado <= st_InactivoHastaComandoNuevo;
                end
            end

        endcase
    end

endmodule