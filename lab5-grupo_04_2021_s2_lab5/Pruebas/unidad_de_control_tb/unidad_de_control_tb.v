`timescale 1ns / 1ps

module Ejecutador_tb;
`include "../fileread_utils.vh"
    
    reg clk = 0;
    reg reset = 0;
    reg equal = 0;
    reg [6:0] funct7 = 0;
    reg [2:0] funct3 = 0;
    reg [6:0] opcode = 0;
    wire [31:0] instruction;

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

    reg [1:0] check_imm_sel = 0;
    reg check_datoA_sel = 0;
    reg check_datoB_sel = 0;
    reg [3:0] check_ALU_control = 0;
    reg check_dato_rd_sel = 0;
    reg check_WE = 0;
    reg [1:0] check_PC_sel = 0;
    reg check_WE_banco_de_registros = 0;

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
        WE_banco_de_registros
    );

    parameter data = "unidad_de_control.dat";
    integer data_file;
    integer file_did_not_open;

    initial forever #100 clk = ~clk;

    initial begin
        $display("Abriendo archivo con datos de prueba ...");
        // $display("----+----------------------------+----------------------------+---------");
        // $display("Ent | Salidas                    | Salidas esperadas          | Errores");
        // $display("|IIIIIIII IIIIIIII|OOOOOOOO O|CCCCCCCC C|OOOOOOOO O|CCCCCCCC C|I III IIIIIIII|O OO|C CC|I|O OOOO OOOOOOOO|C CCCC CCCCCCCC|IIIIIIII|O|C|");
        // $display("----+----------------------------+----------------------------+---------");
        data_file = $fopen(data, "r");
        file_did_not_open = (data_file == 0);
        if (file_did_not_open) $finish;
    end
   
    always @ ( negedge clk ) begin
        data_line = get_line_from_file(data_file);
        $sscanf(data_line, "%b %b %b %b %b %b %b %b %b %b %b %b %b",
            reset, equal, funct7, funct3, opcode,
            check_imm_sel, check_datoA_sel, check_datoB_sel,
            check_ALU_control, check_dato_rd_sel, check_WE,
            check_PC_sel, check_WE_banco_de_registros
        );
        #199;
        //        | i   | o   | c   | o   | c   | i      | o   | c   | i| o      | c      | i| o| c|
        $display("| %b %b %b %b %b | %b | %b %b %b %b %b %b %b %b | %b %b %b %b %b %b %b %b | %s",
            reset, equal, funct7, funct3, opcode,
            instruction,
            imm_sel, datoA_sel, datoB_sel,
            ALU_control, dato_rd_sel, WE,
            PC_sel, WE_banco_de_registros,
            check_imm_sel, check_datoA_sel, check_datoB_sel,
            check_ALU_control, check_dato_rd_sel, check_WE,
            check_PC_sel, check_WE_banco_de_registros
            (check_imm_sel == imm_sel) ||
            (check_datoA_sel == datoA_sel) ||
            (check_datoB_sel == datoB_sel) ||
            (check_ALU_control == ALU_control) ||
            (check_dato_rd_sel == dato_rd_sel) ||
            (check_WE == WE) ||
            (check_PC_sel == PC_sel)
            (check_WE_banco_de_registros == WE_banco_de_registros) ? "ERROR" : ""
        );

        if ($feof(data_file)) begin
            // $display("----+----------------------------+----------------------------+---------");
            $display("Cerrando archivo con datos de prueba ...");
            $fclose(data_file);
            $finish;
        end
    end
endmodule // banco_de_registros_tb
