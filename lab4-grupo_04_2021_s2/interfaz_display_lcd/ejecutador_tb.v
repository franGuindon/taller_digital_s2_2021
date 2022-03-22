`timescale 1ns / 1ps

module Ejecutador_tb;
`include "../fileread_utils.vh"
    
    reg clk = 0;

    reg [31:0] i_reg_control = 32'b0;
    reg [31:0] i_reg_datos = 32'b0;

    wire [31:0] o_in2_reg_control;
    wire o_wr2_reg_control;

    wire [31:0] o_in2_reg_datos;
    wire o_wr2_reg_datos;

    reg i_ready_traductor = 1'b0;
    reg [2:0] i_control_traductor = 3'b0;
    reg [7:0] i_dato_traductor = 8'b0;
    wire o_enable_traductor_bar;
    wire [1:0] o_contador_instruccion_traductor;

    reg i_ready_temporizador = 1'b0;
    wire o_program_temporizador;
    wire [3:0] o_control_temporizador;
    wire [7:0] o_dato_temporizador;
    
    reg [7:0] i_dato_router = 8'b0;
    wire o_direccion_router;


    reg [31:0] check_o_in2_reg_control = 32'b0;
    reg check_o_wr2_reg_control = 1'b0;

    reg [31:0] check_o_in2_reg_datos = 32'b0;
    reg check_o_wr2_reg_datos = 1'b0;

    reg check_o_enable_traductor_bar = 1'b0;
    reg [1:0] check_o_contador_instruccion_traductor = 2'b0;
    
    reg check_o_program_temporizador = 2'b0;
    reg [3:0] check_o_control_temporizador = 2'b0;
    reg [7:0] check_o_dato_temporizador = 2'b0;

    reg check_o_direccion_router = 2'b0;

    reg [63:0] estado = 63'b0;

    Ejecutador e (
        clk,

        i_reg_control,
        i_reg_datos,
        
        o_in2_reg_control,
        o_wr2_reg_control,
        
        o_in2_reg_datos,
        o_wr2_reg_datos,

        i_ready_traductor, // ls en traductor
        i_control_traductor,
        i_dato_traductor,
        o_enable_traductor_bar, // conta en traductor
        o_contador_instruccion_traductor, // listo en traductor

        i_ready_temporizador,
        o_program_temporizador,
        o_control_temporizador,
        o_dato_temporizador,
        
        i_dato_router,
        o_direccion_router
    );

    parameter data = "ejecutador.dat";
    integer data_file;
    integer file_did_not_open;

    initial forever #100 clk = ~clk;

    initial begin
        $display("Abriendo archivo con datos de prueba ...");
        // $display("----+----------------------------+----------------------------+---------");
        // $display("Ent | Salidas                    | Salidas esperadas          | Errores");
        $display("|IIIIIIII IIIIIIII|OOOOOOOO O|CCCCCCCC C|OOOOOOOO O|CCCCCCCC C|I III IIIIIIII|O OO|C CC|I|O OOOO OOOOOOOO|C CCCC CCCCCCCC|IIIIIIII|O|C|");
        // $display("----+----------------------------+----------------------------+---------");
        data_file = $fopen(data, "r");
        file_did_not_open = (data_file == 0);
        if (file_did_not_open) $finish;
    end
   
    always @ ( negedge clk ) begin
        data_line = get_line_from_file(data_file);
        $sscanf(data_line, "%h %h %h %b %h %b %b %b %b %b %b %b %b %b %b %b %b %s",
            i_reg_control,
            i_reg_datos,
            
            check_o_in2_reg_control,
            check_o_wr2_reg_control,
            
            check_o_in2_reg_datos,
            check_o_wr2_reg_datos,

            i_ready_traductor, // ls en traductor
            i_control_traductor,
            i_dato_traductor,
            check_o_enable_traductor_bar, // conta en traductor
            check_o_contador_instruccion_traductor, // listo en traductor

            i_ready_temporizador,
            check_o_program_temporizador,
            check_o_control_temporizador,
            check_o_dato_temporizador,
            
            i_dato_router,
            check_o_direccion_router,
            
            estado
        );
        #199;
        //        | i   | o   | c   | o   | c   | i      | o   | c   | i| o      | c      | i| o| c|
        $display("|%h %h|%h %b|%h %b|%h %b|%h %b|%b %b %b|%b %b|%b %b|%b|%b %b %b|%b %b %b|%b|%b|%b|%s| %s",
            i_reg_control,
            i_reg_datos,
            
            o_in2_reg_control,
            o_wr2_reg_control,

            check_o_in2_reg_control,
            check_o_wr2_reg_control,
            
            o_in2_reg_datos,
            o_wr2_reg_datos,

            check_o_in2_reg_datos,
            check_o_wr2_reg_datos,

            i_ready_traductor, // ls en traductor
            i_control_traductor,
            i_dato_traductor,
            o_enable_traductor_bar, // conta en traductor
            o_contador_instruccion_traductor, // listo en traductor
            check_o_enable_traductor_bar, // conta en traductor
            check_o_contador_instruccion_traductor, // listo en traductor

            i_ready_temporizador,
            o_program_temporizador,
            o_control_temporizador,
            o_dato_temporizador,
            check_o_program_temporizador,
            check_o_control_temporizador,
            check_o_dato_temporizador,
            
            i_dato_router,
            o_direccion_router,
            check_o_direccion_router,
            
            estado,

            ({
                o_in2_reg_control, o_wr2_reg_control,
                o_in2_reg_datos, o_wr2_reg_datos,
                o_enable_traductor_bar, o_contador_instruccion_traductor,
                o_program_temporizador, o_control_temporizador, o_dato_temporizador,
                o_direccion_router
            } != {
                check_o_in2_reg_control, check_o_wr2_reg_control,
                check_o_in2_reg_datos, check_o_wr2_reg_datos,
                check_o_enable_traductor_bar, check_o_contador_instruccion_traductor,
                check_o_program_temporizador, check_o_control_temporizador, check_o_dato_temporizador,
                check_o_direccion_router
            }) ? "ERROR" : ""
        );

        if ($feof(data_file)) begin
            // $display("----+----------------------------+----------------------------+---------");
            $display("Cerrando archivo con datos de prueba ...");
            $fclose(data_file);
            $finish;
        end
    end
endmodule // banco_de_registros_tb
