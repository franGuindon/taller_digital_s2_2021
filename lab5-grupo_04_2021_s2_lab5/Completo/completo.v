`timescale 1ns / 1ps

module Completo(
    input clk,
    input reset,
    input [15:0] sw,
    input [7:0] JXADC,
    output [15:0] led,
    output [6:0] seg,
    output [3:0] an,
    output dp,
    
    input [31:0] i_debug,
    output [31:0] o_debug
);

    wire [31:0] Progin;
    wire [31:0] Datain;
    wire [31:0] Progaddress;
    wire WE;
    wire [31:0] address;
    wire [31:0] Dataout;
    wire [31:0] i_debug_mp;
    wire [31:0] o_debug_mp;

    Microprocesador MP (
        clk,
        reset,
        Progin,
        Datain,
        Progaddress,
        WE,
        address,
        Dataout,

        i_debug_mp,
        o_debug_mp
    );

    assign i_debug_mp = i_debug;
    //assign o_debug = o_debug_mp;
    assign o_debug[7:0] = Progaddress[7:0];
    assign o_debug[15:8] = o_debug_mp[7:0];
    
    
    wire [31:0] douta_rom;
    wire [31:0] addra_rom;

    assign addra_rom = Progaddress / 4;
    assign Progin = douta_rom;

    ROM_inst ROM (
        douta_rom,
        addra_rom,
        clk,
        reset
    );

    wire [31:0] douta_ram;
    wire [31:0] dina_ram;
    wire [31:0] addra_ram;
    wire wea_ram;

    assign addra_ram = address / 4;
    assign Datain = (32'h0 <= address && address <= 32'hFF) ? douta_ram : 32'bz;
    assign wea_ram = (32'h0 <= address && address <= 32'hFF) ? WE : 1'b0;

    RAM_inst RAM (
        douta,
        dina,
        addra,
        clk,
        reset,
        wea_ram
    );

    visualizacion_led LEDS (
        clk,
        WE,
        address,
        Dataout,
        led
    );

    visual7segmentos SIETE_SEGS (
        Dataout,
        address,
        clk,
        WE,
        seg,
        an,
        dp
    );

    wire [3:0] sw_multiplicador;

    assign sw_multiplicador = sw[5:2];

    Multiplicador M (
        sw_multiplicador,
        address, 
        clk,
        Datain
    );

    wire [9:0] sw_offset;

    assign sw_offset = sw[15:6];

    offset Offset (
        sw_offset,
        address,
        clk,
        Datain
    );

    // sensor y contador falso
    //assign Datain = (address == 32'h100) ? 32'b100_1110 : 32'bz;
    //assign Datain = (address == 32'h10C) ? 32'b10 : 32'bz;

    sensor adc (
        clk,
        JXADC,
        address,
        Datain
    );

    wire [1:0] sw_cnt;

    assign sw_cnt = sw[1:0];

    Contador cnt (
        clk,
        reset,
        sw_cnt,
        Dataout,
        address,
        WE,
        Datain
    );

endmodule