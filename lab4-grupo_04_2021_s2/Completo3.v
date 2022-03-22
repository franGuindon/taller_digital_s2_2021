`timescale 1ns / 1ps


module Completo3(
input rst,clk,botoncenter, switch15,
input [7:0]data_data,//interrruptores
input [3:0]comando_data,//interruptores bin
inout [7:0] PMOD,
output  [3:0] contr_PMOD,
inout [7:0] PMOD_led,
output  [3:0] contr_PMOD_led,
output [3:0] extra_led);


wire brst,bclk,bbotoncenter, bswitch15;
wire [7:0] b_data;//interrruptores
wire [3:0] b_comando_data;//interruptores bin
//[31:0]
wire wr;
wire [31:0] IN1;
wire [31:0] IN2d;
wire [31:0] IN2c;
wire WN1d;
wire WN1c;
wire WN2d;
wire WN2c;
wire [31:0]outd;
wire [31:0]outc;
wire reg_sel;
wire [31:0] salida;

assign contr_PMOD_led = contr_PMOD;
assign PMOD_led = PMOD;

//debouncing
   
// debouncingpush rst1(
// .clk(clk),
// .key(rst),
// .led(brst)
// );
assign brst = rst;

// debouncingpush botoncenter1(
// .clk(clk),
// .key(botoncenter),
// .led(bbotoncenter)
// );
// assign bbotoncenter = botoncenter;

// debouncingpush sw1(
// .clk(clk),
// .key(switch15),
// .led(bswitch15)
// );
assign bswitch15 = switch15;


// debouncingpush dd[7:0](
// .clk(clk),
// .key(data_data),
// .led(b_data)
// );
assign b_data = data_data;


// debouncingpush cc[3:0](
// .clk(clk),
// .key(comando_data),
// .led(b_comando_data)
// );
assign b_comando_data = comando_data;


//Generador de datos
generador_de_datos
gn(.clk(clk), .sel_addr_dat(bswitch15), .send(botoncenter), .comando(b_comando_data), .dato(b_data), 
.rst(brst), .data_in(salida), .data_out(IN1), .reg_sel(reg_sel), .wr(wr));

assign extra_led = {outc[0], outc[1], outd[0], outd[1]};

//Datos
banco_de_registros 
 dat(.data_in1(IN1), 
.data_in2(IN2d), .w1(WN1d),.w2(WN2d), 
.clk(clk), .rst(brst), .out1(outd));  

//Control 
banco_de_registros
 ctr(.data_in1(IN1), 
.data_in2(IN2c), .w1(WN1c),.w2(WN2c), 
.clk(clk), .rst(brst), .out1(outc));     
//Interfaz

//assign PMOD = IN1[7:0];
//assign contr_PMOD = {reg_sel, wr, botoncenter, bswitch15};

Interfazc it(
.reg_datos(outd),
.reg_control(outc),
.pmod(PMOD),
.clk(clk),
.display_control(contr_PMOD),
.WN2D(WN2d),
.WN2C(WN2c),
.IN2D(IN2d),
.IN2C(IN2c)
    );


assign WN1d = reg_sel == 0 ? 1'b0 : wr;
assign WN1c = reg_sel == 0 ? wr : 1'b0;
assign salida = reg_sel == 0 ? outc : outd;

endmodule
