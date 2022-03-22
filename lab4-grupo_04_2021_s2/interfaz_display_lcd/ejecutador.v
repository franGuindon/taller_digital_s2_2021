`timescale 10ns / 100ps

module Ejecutador (
    input clk,

    input [31:0] i_reg_control,
    input [31:0] i_reg_datos,

    output reg [31:0] o_in2_reg_control,
    output reg o_wr2_reg_control,

    output reg [31:0] o_in2_reg_datos,
    output reg o_wr2_reg_datos,

    input i_ready_traductor, // ls en traductor
    input [2:0] i_control_traductor,
    input [7:0] i_dato_traductor,
    output reg o_enable_traductor_bar, // conta en traductor
    output reg [1:0] o_contador_instruccion_traductor, // listo en traductor

    input i_ready_temporizador,
    output reg o_program_temporizador,
    output reg [3:0] o_control_temporizador,
    output reg [7:0] o_dato_temporizador,
    
    input [7:0] i_dato_router,
    output reg o_direccion_router);

    initial o_in2_reg_control = 32'h0000_0000;
    initial o_wr2_reg_control = 1'b0;
    initial o_in2_reg_datos = 32'h0000_0000;
    initial o_wr2_reg_datos = 1'b0;
    initial o_enable_traductor_bar = 1'b1;
    initial o_contador_instruccion_traductor = 2'b00;
    initial o_program_temporizador = 1'b0;
    initial o_control_temporizador = 4'b0000;
    initial o_dato_temporizador = 8'b0000_0000;
    initial o_direccion_router = 1'b0;

    parameter EXEC = 1'b1;
    parameter BUSY_FLAG = 3'h7;
    parameter TRADUCTOR_TERMINADO = 1'b0;
    parameter LEER_ESCRIBIR = 1'b1;
    
    reg [31:0] _reg_control = 32'h0000_0000;
    reg [31:0] _reg_datos = 32'h0000_0000;

    parameter st_LeerRegistros = 4'b0000;
    parameter st_CambiarExec = 4'b0001;
    parameter st_TraducirYEjecutarComando = 4'b0010;
    parameter st_LeerDatosDelCommando = 4'b0011;
    parameter st_EjecutarBusyFlag = 4'b0100;
    parameter st_LeerBusyFlag = 4'b0101;
    parameter st_DecisionBusyFlag = 4'b0110;
    parameter st_DecisionTraductor = 4'b0111;
    parameter st_EscribirRegistros = 4'b1000;
    parameter st_Inactivo = 4'b1001;

    reg [3:0] estado = st_Inactivo;
    reg contador_estado = 1'b0;

    always @ ( posedge clk ) begin
        if (i_ready_temporizador == 1'b1) begin
            case (estado)
            
                st_LeerRegistros: begin
                    _reg_control <= i_reg_control;
                    _reg_datos <= i_reg_datos;
                    estado <= st_CambiarExec;
                end

                st_CambiarExec: begin
                    if (i_reg_control[EXEC] == 1'b1) begin
                        o_wr2_reg_control <= 1'b1;
                        o_in2_reg_control <= _reg_control & ~32'h0000_0002;
                        _reg_control <= _reg_control & ~32'h0000_0002;
                    end
                    else begin
                        o_enable_traductor_bar <= 1'b0;
                        estado <= st_TraducirYEjecutarComando;
                    end
                end

                st_TraducirYEjecutarComando: begin
                    o_wr2_reg_control <= 1'b0; // resetea de escritura pasada
                    o_control_temporizador <= {i_control_traductor, 1'b0};
                    o_dato_temporizador <= i_dato_traductor;
                    
                    if (contador_estado == 1'b0) begin
                        contador_estado <= 1'b1;
                        o_program_temporizador <= 1'b1;
                    end
                    else if (i_control_traductor[LEER_ESCRIBIR] == 1'b1) begin
                        o_direccion_router <= 1'b1;
                        estado <= st_LeerDatosDelCommando;
                        contador_estado <= 1'b0;
                        o_program_temporizador <= 1'b0;
                    end
                    else begin
                        estado <= st_EjecutarBusyFlag;
                        contador_estado <= 1'b0;
                        o_program_temporizador <= 1'b0;
                    end
                end

                st_LeerDatosDelCommando: begin
                    o_direccion_router <= 1'b0;
                    _reg_datos <= {24'h0000_00, i_dato_router};
                    estado <= st_DecisionTraductor;
                end

                st_EjecutarBusyFlag: begin
                    o_control_temporizador <= 4'b0100;
                    o_dato_temporizador <= 8'b0000_0000;
                    o_direccion_router <= 1'b1;
                    
                    if (contador_estado == 1'b0) begin
                        contador_estado <= 1'b1;
                        o_program_temporizador <= 1'b1;
                    end
                    else begin
                        estado <= st_LeerBusyFlag;
                        contador_estado <= 1'b0;
                        o_program_temporizador <= 1'b0;
                    end
                end

                st_LeerBusyFlag: begin
                    o_direccion_router <= 1'b0;
                    _reg_datos <= {24'h0000_00, i_dato_router};
                    estado <= st_DecisionBusyFlag;
                end

                st_DecisionBusyFlag: begin
                    if (_reg_datos[BUSY_FLAG] == 1'b1) begin
                        estado <= st_EjecutarBusyFlag;
                    end
                    else begin
                        estado <= st_DecisionTraductor;
                    end
                end
                
                st_DecisionTraductor: begin
                    if (i_ready_traductor == TRADUCTOR_TERMINADO) begin
                        estado <= st_EscribirRegistros;
                        o_contador_instruccion_traductor <= 2'b00;
                        o_enable_traductor_bar <= 1'b1;
                    end
                    else begin
                        o_contador_instruccion_traductor <=  o_contador_instruccion_traductor + 1;
                        estado <= st_TraducirYEjecutarComando;
                    end
                end

                st_EscribirRegistros: begin
                    o_wr2_reg_control <= 1'b1;
                    o_wr2_reg_datos <= 1'b1;
                    o_in2_reg_control <= _reg_control | 32'h0000_0001;
                    _reg_control <= _reg_control | 32'h0000_0001;
                    o_in2_reg_datos <= _reg_datos;
                    estado <= st_Inactivo;
                end

                st_Inactivo: begin
                    o_wr2_reg_control <= 1'b0;
                    o_wr2_reg_datos <= 1'b0;
                    
                    if (i_reg_control[EXEC] == 1'b1) begin
                        estado <= st_LeerRegistros;
                    end
                end

            endcase
        end
    end
endmodule