`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 16.10.2021 20:54:30
// Design Name: 
// Module Name: Interfazc
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Interfazc(
input [31:0] reg_datos,
input [31:0] reg_control,
inout [7:0] pmod,
input clk,
output [3:0] display_control,
output WN2D,
output WN2C,
output [31:0] IN2D,
output [31:0] IN2C
    );
    
wire [2:0] control_traductor;
wire [7:0] dato_traductor;
wire       enable_traductor;
wire [1:0] conta_traductor;
wire       ready_traductor;
wire       ready_temp;
wire       progra_temp;
wire [3:0] control_temp;
wire [7:0] dato_temp;
wire [7:0] dato_temp_router;
wire [7:0] dato_router;
wire       router_dir;




 Ejecutador ej(
    .clk(clk),

    .i_reg_control(reg_control),
    .i_reg_datos(reg_datos),

    .o_in2_reg_control(IN2C),
    .o_wr2_reg_control(WN2C),

    .o_in2_reg_datos(IN2D),
    .o_wr2_reg_datos(WN2D),

    .i_ready_traductor(ready_traductor), // ls en traductor
    .i_control_traductor(control_traductor),
    .i_dato_traductor(dato_traductor),
    .o_enable_traductor_bar(enable_traductor), // conta en traductor
    .o_contador_instruccion_traductor(conta_traductor), // listo en traductor

    .i_ready_temporizador(ready_temp),
    .o_program_temporizador(progra_temp),
    .o_control_temporizador(control_temp),
    .o_dato_temporizador(dato_temp),
    
    .i_dato_router(dato_router),
    .o_direccion_router(router_dir));   
    
    Traductor tt(
.inst(reg_control),
.conta(enable_traductor),
.info(reg_datos),
.data(dato_traductor),
.control(control_traductor),
.listo(conta_traductor),
.ls(ready_traductor)
    );
    
TemporizadorPmodCLP #(200 // 2
    ) pm(
    .clk(clk),
    .i_program(progra_temp),
    .i_control(control_temp),
    .i_data(dato_temp),
    .o_ready(ready_temp),
    .o_control(display_control),
    .o_data(dato_temp_router));

RouterDatos #(20_000_000 // 2
    ) rd(
   .clk(clk),
    .direction(router_dir),
    .i_data(dato_temp_router),
    .io_data(pmod),
    .o_data(dato_router));  
 
endmodule
