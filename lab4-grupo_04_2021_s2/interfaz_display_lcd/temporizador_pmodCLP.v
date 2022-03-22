`timescale 10ns / 100ps

module TemporizadorPmodCLP #(
    parameter DELAY_IN_CYCLES = 2) (
    input clk,
    input i_program,
    input [3:0] i_control,
    input [7:0] i_data,
    output reg o_ready,
    output reg [3:0] o_control,
    output reg [7:0] o_data);

    initial o_ready = 1'b1;
    initial o_control = 4'b0000;
    initial o_data = 8'b0000_0000;

    reg rst = 1'b1;
    wire [2:0] counter;
    ContadorDelayAjustable #(
        .DELAY_IN_CYCLES(DELAY_IN_CYCLES),
        .COUNTER_WIDTH(3)
    ) CDA (
        .clk(~clk),
        .rst(rst),
        .o_count(counter)
    );

    parameter st_Idle = {1'b1, 1'b1, 3'b000};
    parameter st_ActivateEnable = {1'b0, 1'b0, 3'b001};
    parameter st_DeactivateEnable = {1'b0, 1'b0, 3'b011};
    parameter st_Finished = {1'b0, 1'b0, 3'b100};

    always @ (posedge clk) begin
        case ( {o_ready, rst, counter} )
            
            st_Idle: begin
                if (i_program == 1'b1) begin
                    o_control <= i_control;
                    o_data <= i_data;
                    rst <= 1'b0;
                    o_ready <= 1'b0;
                end
            end

            st_ActivateEnable: begin
                o_control <= o_control | 4'b0010;
            end

            st_DeactivateEnable: begin
                o_control <= o_control & 4'b1101;
            end

            st_Finished: begin
                rst <= 1'b1;
                o_ready <= 1'b1;
            end

        endcase
    end

endmodule