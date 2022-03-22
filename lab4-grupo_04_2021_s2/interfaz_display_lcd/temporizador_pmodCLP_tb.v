`timescale 1ns / 1ps

module TemporizadorPmodCLP_tb;
`include "../fileread_utils.vh"
   
    reg clk = 0;
    reg program = 0;
    reg [3:0] i_control = 0;
    reg [7:0] i_data = 0;
    wire ready;
    wire [3:0] o_control;
    wire [7:0] o_data;
    reg check_ready = 0;
    reg [3:0] check_o_control = 0;
    reg [7:0] check_o_data = 0;

    TemporizadorPmodCLP #(
        .DELAY_IN_CYCLES(2)
    ) TPCLP (
        .clk(clk),
        .i_program(program),
        .i_control(i_control),
        .i_data(i_data),
        .o_ready(ready),
        .o_control(o_control),
        .o_data(o_data)
    );

    parameter data = "temporizador_pmodCLP.dat";
    integer data_file;
    integer file_did_not_open;

    initial forever #100 clk = ~clk;

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
   
    always @ ( negedge clk ) begin
        data_line = get_line_from_file(data_file);
        $sscanf(data_line, "%b %b %b %b %b %b",
            program, i_control, i_data,
            check_ready, check_o_control, check_o_data
        );
        #199;
        $display(
            "%b %b %b | %b %b %b | %b %b %b | %s",
            program, i_control, i_data,
            ready, o_control, o_data,
            check_ready, check_o_control, check_o_data, (
                (check_ready != ready) ||
                (check_o_control != o_control) ||
                (check_o_data != o_data) ? "ERROR" : ""
            )
        );

        if ($feof(data_file)) begin
            // $display("----+----------------------------+----------------------------+---------");
            $display("Cerrando archivo con datos de prueba ...");
            $fclose(data_file);
            $finish;
        end
    end
endmodule // banco_de_registros_tb
