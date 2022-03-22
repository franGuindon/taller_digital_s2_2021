`timescale 1ns / 1ps

module RouterDatos_tb;
`include "../fileread_utils.vh"
    reg clk = 0;
    reg direction = 0;
    reg [7:0] i_data = 0;
    reg [7:0] io_data = 0;

    wire [7:0] io_data_w;
    assign io_data_w = direction ? io_data: 8'bz;

    wire [7:0] o_data;
    reg [7:0] check_io_data = 0;
    reg [7:0] check_o_data = 0;

    RouterDatos RD (
        .clk(clk),
        .direction(direction),
        .i_data(i_data),
        .io_data(io_data_w),
        .o_data(o_data)
    );

    parameter data = "router_datos.dat";
    integer data_file;
    integer file_did_not_open;

    initial forever #100 clk = ~clk;

    initial begin
        $display("Abriendo archivo con datos de prueba ...");
        // $display("----+----------------------------+----------------------------+---------");
        // $display("Ent | Salidas                    | Salidas esperadas          | Errores");
        $display("|d in | io | o  |cio co |");
        // $display("----+----------------------------+----------------------------+---------");
        data_file = $fopen(data, "r");
        file_did_not_open = (data_file == 0);
        if (file_did_not_open) $finish;
    end
   
    always @ ( negedge clk ) begin
        data_line = get_line_from_file(data_file);
        $sscanf(data_line, "%b %h %h %h %h",
            direction, i_data, io_data, check_io_data, check_o_data
        );
        #199;
        $display(
            "|%b %h | %h | %h | %h %h | %s",
            direction, i_data, io_data_w, o_data,
            check_io_data, check_o_data, (
                (check_io_data != io_data_w) ||
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
