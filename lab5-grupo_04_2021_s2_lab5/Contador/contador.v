`timescale 1ns / 1ps

module Contador(
    input clk,
    input rst,
    input [1:0] sw,
    input [31:0] Dataout,
    input [31:0] address,
    input WE,
    output [31:0] Datain
);

    reg [31:0] control = 32'b0;
    reg [31:0] periodo = 32'b0;
    integer contador = 0;

    localparam st_Inactivo = 0;
    localparam st_LimpiarMSByLSB = 1;
    localparam st_LeerSwitches = 2;
    localparam st_Contar = 3;
    localparam st_PonerMSB = 4;

    reg [2:0] estado = st_Inactivo;

    localparam sw_500ms = 0;
    localparam sw_1s = 1;
    localparam sw_2s = 2;
    localparam sw_4s = 3;

    localparam t_500ms = 500_000_00;
    localparam t_1s = 1_000_000_00;
    localparam t_2s = 2_000_000_00;
    localparam t_4s = 4_000_000_00;

    assign Datain = (address == 32'h10C) ? control : 32'bz;

    always @ ( posedge clk ) begin
        
        if (WE == 1'b1 && address == 32'h10C)
            control <= Dataout;
        
        if (rst == 1'b1) begin
            control[1] <= 1'b1;
            estado <= st_Inactivo;
            contador <= 0;
        end
        else case (estado)

            st_Inactivo: begin
                if (control[0] == 1'b1)
                    estado <= st_LimpiarMSByLSB;
            end

            st_LimpiarMSByLSB: begin
                if (WE != 1'b1) begin
                    control <= 32'b0;
                    estado <= st_LeerSwitches;
                end
            end

            st_LeerSwitches: begin
                case (sw)
                    sw_500ms: periodo <= t_500ms;
                    sw_1s: periodo <= t_1s;
                    sw_2s: periodo <= t_2s;
                    sw_4s: periodo <= t_4s;
                    default: periodo <= t_500ms;
                endcase
                estado <= st_Contar;
            end
            
            st_Contar: begin
                if (contador < periodo)
                    contador <= contador + 1;
                else begin
                    contador <= 0;
                    estado <= st_PonerMSB;
                end
            end

            st_PonerMSB: begin
                if (WE != 1'b1) begin
                    control[1] <= 1'b1;
                    estado <= st_Inactivo;
                end
            end
            
            default: estado <= st_Inactivo;

        endcase
    end

endmodule