`timescale 1ns / 1ps

module Experimento1TopTb;
    `include "../fileread_utils.vh"
    
    reg clk = 0;
    reg we = 0;
    wire [7:0] seven_segments;
    wire [3:0] anode_pins;
    reg [7:0] check_seven_segments = 0;
    reg [3:0] check_anode_pins = 0;

    Experimento1Top #(
        .DATA_DELAY_IN_CYCLES(2),
        .DISPLAY_DELAY_IN_CYCLES(1)
        ) E1T (
            .clk(clk),
            .we(we),
            .o_seven_segments(seven_segments),
            .o_anode_pins(anode_pins)
        );
    
    parameter data = "experimento_1_top.dat";
    integer data_file;
    integer file_did_not_open;
   
    initial begin
        forever #100 clk = ~clk;
    end
   
    initial begin
        $display("Abriendo archivo con datos de prueba ...");
        // $display("----+----------------------------+----------------------------+---------");
        // $display("Ent | Salidas                    | Salidas esperadas          | Errores");
        // $display("  r | s w   rs1   rs2    rd   op | s w   rs1   rs2    rd   op |");
        // $display("----+----------------------------+----------------------------+---------");
        data_file = $fopen(data, "r");
        file_did_not_open = (data_file == 0);
        if (file_did_not_open) $finish;
    end
   
    always @(negedge clk) begin
        data_line = get_line_from_file(data_file);
        $sscanf(data_line, "%b %b %b",
            we, check_seven_segments, check_anode_pins
        );
        #199;
        $display(
            "%b | %b %b | %b %b | %s",
            we, seven_segments, anode_pins,
            check_seven_segments, check_anode_pins,
            ((seven_segments != check_seven_segments) ||
            (anode_pins != check_anode_pins) ? "ERROR" : "")
        );
        
        if ($feof(data_file)) begin
        // $display("----+----------------------------+----------------------------+---------");
        $display("Cerrando archivo con datos de prueba ...");
        $fclose(data_file);
        $finish;
        end
    end
endmodule // banco_de_registros_tb
