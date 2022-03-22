`timescale 1ns / 1ps

module Microprocesador (
    input clk,
    input reset,
    input [31:0] Progin,
    input [31:0] Datain,
    output [31:0] Progaddress,
    output WE,
    output [31:0] address,
    output [31:0] Dataout,

    input [31:0] i_debug,
    output [31:0] o_debug
);

    wire [31:0] instruction;
    wire equal;
    wire [2:0] imm_sel;
    wire datoA_sel;
    wire datoB_sel;
    wire [3:0] ALU_control;
    wire dato_rd_sel;
    wire [1:0] PC_sel;
    wire WE_banco_de_registros;
    wire [2:0] estado;
    wire [31:0] debug_udc;

    UnidadDeControl UDC (
        clk,
        instruction,
        equal,
        reset,
        imm_sel,
        datoA_sel,
        datoB_sel,
        ALU_control,
        dato_rd_sel,
        WE,
        PC_sel,
        WE_banco_de_registros,
        estado,
        debug_udc
    );

    //assign o_debug[2:0] = estado;

    /* Fetch */

    wire [31:0] jumpDir;

    ProgramCounter #(32) PC (
        jumpDir,
        Progaddress,
        clk,
        PC_sel
    );

    wire [4:0] addr_rs1;
    wire [4:0] addr_rs2;
    wire [4:0] addr_rd;
    wire [31:0] dato_wb;
    wire [31:0] rs1;
    wire [31:0] rs2;

    /* Decode */

    reg [31:0] registro_de_instruccion;

    assign instruction = registro_de_instruccion;
    assign addr_rs1 = i_debug[5] == 1'b1 ? i_debug[4:0] : registro_de_instruccion[19:15];
    assign addr_rs2 = registro_de_instruccion[24:20];
    assign addr_rd = registro_de_instruccion[11:7];

    banco_de_registros BDE (
        addr_rs1,
        addr_rs2,
        addr_rd,
        dato_wb,
        WE_banco_de_registros,
        clk,
        reset,
        rs1,
        rs2
    );
    
    //assign o_debug[15:8] = rs1[ i_debug[7:6]*8 +: 8 ];

    assign equal = (rs1 == rs2);

    localparam imm_sel_para_tipo_R = 3'b000;
    localparam imm_sel_para_tipo_I_A = 3'b000;
    localparam imm_sel_para_tipo_I_L = 3'b001;
    localparam imm_sel_para_tipo_J = 3'b010;
    localparam imm_sel_para_tipo_B = 3'b011;
    localparam imm_sel_para_tipo_S = 3'b100;

    wire [31:0] imm;
    wire [31:0] imm_para_tipo_I_A;
    wire [31:0] imm_para_tipo_I_L;
    wire [31:0] imm_para_tipo_J;
    wire [31:0] imm_para_tipo_B;
    wire [31:0] imm_para_tipo_S;

    assign imm_para_tipo_I_A = {
        {20{registro_de_instruccion[31]}}, 
        registro_de_instruccion[31:20]
    };
    assign imm_para_tipo_I_L = {
        {20{1'b0}},
        registro_de_instruccion[31:20]
    };
    assign imm_para_tipo_J = { // 1111_1111_1111.1111_1111.1.111_0011_110.0
        {12{registro_de_instruccion[31]}}, // i[31] = 1
        registro_de_instruccion[19:12], // i[19:12] = 1111_1111
        registro_de_instruccion[20], // i[20] = 1
        registro_de_instruccion[30:21], // i[30:21] = 111_0011_110
        1'b0 // 0
    }; // 1.111_0011_110.1.1111_1111.00000.1101111 // 1111_0011_1101_1111_1111_0000_0110_1111 // f3dff06f
    assign imm_para_tipo_B = {
        {20{registro_de_instruccion[31]}},
        registro_de_instruccion[7],
        registro_de_instruccion[30:25],
        registro_de_instruccion[11:8],
        1'b0
    };
    assign imm_para_tipo_S = {
        {20{registro_de_instruccion[31]}},
        registro_de_instruccion[31:25],
        registro_de_instruccion[11:7]
    };

    assign imm = (
        imm_sel == imm_sel_para_tipo_I_A ? imm_para_tipo_I_A:
        imm_sel == imm_sel_para_tipo_I_L ? imm_para_tipo_I_L:
        imm_sel == imm_sel_para_tipo_J ? imm_para_tipo_J:
        imm_sel == imm_sel_para_tipo_B ? imm_para_tipo_B:
        imm_sel == imm_sel_para_tipo_S ? imm_para_tipo_S:
        /* Caso por defecto */ 32'h0000_0000
    );
    
    assign o_debug = imm;

    localparam datoA_es_rs1 = 1'b0;
    localparam datoB_es_rs2 = 1'b0;
    
    wire [31:0] datoA;
    wire [31:0] datoB;
    
    assign datoA = (datoA_sel == datoA_es_rs1) ? rs1 : Progaddress;
    assign datoB = (datoB_sel == datoB_es_rs2) ? rs2 : imm;

    reg [63:0] registro_resultado_decode;
    
    /* Execute */

    wire [31:0] ALUA;
    wire [31:0] ALUB;
    wire [31:0] ALUResult;

    assign ALUA = registro_resultado_decode[63:32];
    assign ALUB = registro_resultado_decode[31:0];

    ALU #(32) alu (
        ALUA,
        ALUB,
        ALU_control,
        1'b0,
        ALUResult
    );  // tal vez hay que lidiar con C y Z

    reg [63:0] registro_resultado_execute;
    
    /* Memory */

    localparam dato_rd_sel_para_DataIn = 1'b0;

    wire [31:0] dato_rd;
    wire [31:0] ALUResult_mem;
    
    assign ALUResult_mem = registro_resultado_execute[63:32];
    assign jumpDir = ALUResult_mem;
    assign address = ALUResult_mem;
    assign Dataout = registro_resultado_execute[31:0];
    assign dato_rd = (dato_rd_sel == dato_rd_sel_para_DataIn) ? Datain: ALUResult_mem;

    reg [31:0] registro_resultado_mem;

    /* Writeback */
    assign dato_wb = registro_resultado_mem[31:0];

    localparam st_Fetch = 0;
    localparam st_Decode = 1;
    localparam st_Execute = 2;
    localparam st_Memory = 3;
    localparam st_Writeback = 4;

    always @ ( posedge clk ) begin
        if (estado == st_Fetch)
            registro_de_instruccion <= Progin;
        if (estado == st_Decode)
            registro_resultado_decode <= {datoA, datoB};
        if (estado == st_Execute)
            registro_resultado_execute <= {ALUResult, rs2};
        if (estado == st_Memory)
            registro_resultado_mem <= {address, dato_rd};
    end

endmodule