`timescale 1ns / 1ps

module sensor (
    input clk,
    input [7:0] JXADC,
    input [31:0] address,
    output [31:0] data_in
);

    wire [15:0] data;
    wire enable;
    wire ready;

    wire
        vauxp6, vauxn6,
        vauxp7, vauxn7,
        vauxp14, vauxn14,
        vauxp15, vauxn15
    ;

    assign vauxp6 = JXADC[4];
    assign vauxp7 = JXADC[5];
    assign vauxp14 = JXADC[6];
    assign vauxp15 = JXADC[7];

    assign vauxn6 = JXADC[0];
    assign vauxn7 = JXADC[1];
    assign vauxn14 = JXADC[2];
    assign vauxn15 = JXADC[3];

    reg [15:0] reg_sensor = 0;

    xadc_wiz_0 inst (
        .daddr_in(8'h16),
        .dclk_in(clk),
        .den_in(enable),
        .di_in(16'b0),
        .dwe_in(1'b0),
        .reset_in(1'b0),
        .vauxp6(vauxp6),
        .vauxn6(vauxn6),
        .vauxp7(vauxp7),
        .vauxn7(vauxn7),
        .vauxp14(vauxp14),
        .vauxn14(vauxn14),
        .vauxp15(vauxp15),
        .vauxn15(vauxn15),
        .busy_out(),
        .channel_out(),
        .do_out(data), //salida
        .drdy_out(ready),
        .eoc_out(enable),
        .eos_out(),
        .alarm_out(),
        .vp_in(vp_in_notused),
        .vn_in(vn_in_notused)
    );

    always @ ( posedge clk ) begin
        if ( ready == 1'b1 ) reg_sensor <= data;
    end

    assign data_in = (address == 32'h0100) ? 32'b0 | reg_sensor : 32'bz;
    
endmodule