`timescale 10ns / 100ps

module RouterDatos #(
    parameter DELAY_IN_CYCLES = 3) (
    input clk,
    input direction,
    input [7:0] i_data,
    output reg [7:0] io_data,
    output reg [7:0] o_data );
    
    initial io_data = 8'b0;
    initial o_data = 8'b0;

    reg rst = 1'b1;
    wire counter;
    ContadorDelayAjustable #(
        .DELAY_IN_CYCLES(DELAY_IN_CYCLES),
        .COUNTER_WIDTH(1)
    ) CDA (
        .clk(~clk),
        .rst(rst),
        .o_count(counter)
    );
    
    initial io_data=8'b0;
    initial o_data=8'b1000_0000;

    parameter st_Idle = 2'b00;
    parameter st_Busy = 2'b01;
    parameter st_Listo = 2'b10;

    reg [1:0] estado = st_Idle;

    always @ (posedge clk) begin
        
        if (direction == 1'b1) begin
            io_data <= 8'bz;
        end
        else begin
            io_data <= i_data;
        end

        case (estado)

            st_Idle: begin
                if (direction == 1'b1) begin
                    rst <= 1'b0;
                    estado <= st_Busy;
                    o_data <= 8'b1000_0000;
                end
            end
            
            st_Busy: begin
                if (counter == 1'b1) begin
                    estado <= st_Listo;
                    rst <= 1'b1;
                end
            end

            st_Listo: begin
                o_data <= 8'b0000_0000;
                if (direction == 1'b0) begin
                    estado <= st_Idle;
                end
            end

        endcase
    end

endmodule