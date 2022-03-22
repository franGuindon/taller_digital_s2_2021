`timescale 1ns / 1ps

module UnidadDeControl (
    input clk,
    input [31:0] instruction,
    input equal,
    input reset,
    output [2:0] imm_sel,
    output datoA_sel,
    output datoB_sel,
    output [3:0] ALU_control,
    output dato_rd_sel,
    output WE,
    output [1:0] PC_sel,
    output WE_banco_de_registros,
    output reg [2:0] estado,
    output [31:0] debug
);

    /* Variables generales */
    wire [6:0] opcode;
    wire [2:0] funct3;
    wire [6:0] funct7;
    wire [16:0] instr_code;

    assign opcode = instruction[6:0];
    assign funct3 = instruction[14:12];
    assign funct7 = instruction[31:25];
    assign instr_code = {funct7, funct3, opcode};

    localparam LW_code = {3'b010, 7'b000_0011};
    localparam SW_code = {3'b010, 7'b010_0011};
    localparam ADD_code = {7'b000_0000, 3'b000, 7'b011_0011};
    localparam SUB_code = {7'b010_0000, 3'b000, 7'b011_0011};
    localparam OR_code = {7'b000_0000, 3'b110, 7'b011_0011};
    localparam AND_code = {7'b000_0000, 3'b111, 7'b011_0011};
    localparam ADDI_code = {3'b000, 7'b001_0011};
    localparam SLL_code = {7'b000_0000, 3'b001, 7'b011_0011};
    localparam SRL_code = {7'b000_0000, 3'b101, 7'b011_0011};
    localparam ORI_code = {3'b110, 7'b001_0011}; 
    localparam ANDI_code = {3'b111, 7'b001_0011};
    localparam BEQ_code = {3'b000, 7'b110_0011};
    localparam JAL_code = 7'b110_1111;
    // localparam JALR_code = {7'bXXX_XXX, 3'b000, 7'b110_0111};

    wire instr_es_LW;
    wire instr_es_SW;
    wire instr_es_ADD;
    wire instr_es_SUB;
    wire instr_es_OR;
    wire instr_es_AND;
    wire instr_es_ADDI;
    wire instr_es_SLL;
    wire instr_es_SRL;
    wire instr_es_ORI;
    wire instr_es_ANDI;
    wire instr_es_BEQ;
    wire instr_es_JAL;
    // wire instr_es_JALR;

    assign instr_es_LW = ({funct3, opcode} == LW_code);
    assign instr_es_SW = ({funct3, opcode} == SW_code);
    assign instr_es_ADD = (instr_code == ADD_code);
    assign instr_es_SUB = (instr_code == SUB_code);
    assign instr_es_OR = (instr_code == OR_code);
    assign instr_es_AND = (instr_code == AND_code);
    assign instr_es_ADDI = ({funct3, opcode} == ADDI_code);
    assign instr_es_SLL = (instr_code == SLL_code);
    assign instr_es_SRL = (instr_code == SRL_code);
    assign instr_es_ORI = ({funct3, opcode} == ORI_code);
    assign instr_es_ANDI = ({funct3, opcode} == ANDI_code);
    assign instr_es_BEQ = ({funct3, opcode} == BEQ_code);
    assign instr_es_JAL = (opcode == JAL_code);
    // assign instr_es_JALR = (instr_code == JALR_code);

    /* Máquina de estados */
    localparam st_Fetch = 0;
    localparam st_Decode = 1;
    localparam st_Execute = 2;
    localparam st_Memory = 3;
    localparam st_Writeback = 4;
    
    initial estado = st_Fetch;
    
    always @ (posedge clk) begin
        case (estado)

            st_Fetch:
                estado <= st_Decode;

            st_Decode:
                estado <= st_Execute;

            st_Execute:
                estado <= st_Memory;

            st_Memory:
                estado <= st_Writeback;

            st_Writeback:
                estado <= st_Fetch;

            default:
                estado <= st_Fetch;

        endcase
    end

    /* Decode : Cambia imm_sel, datoA_sel, datoB_sel */
    localparam imm_sel_para_tipo_R = 3'b000;
    localparam imm_sel_para_tipo_I_A = 3'b000;
    localparam imm_sel_para_tipo_I_L = 3'b001;
    localparam imm_sel_para_tipo_J = 3'b010;
    localparam imm_sel_para_tipo_B = 3'b011;
    localparam imm_sel_para_tipo_S = 3'b100;

    localparam datoA_es_rs1 = 1'b0;
    localparam datoA_es_pc = 1'b1;
    localparam datoB_es_rs2 = 1'b0;
    localparam datoB_es_imm = 1'b1;
    
    wire instr_es_tipo_R;
    wire instr_es_tipo_I;
    wire instr_es_tipo_I_A;
    wire instr_es_tipo_I_L;
    wire instr_es_tipo_J;
    wire instr_es_tipo_B;
    wire instr_es_tipo_S;

    assign instr_es_tipo_R = (
        instr_es_AND ||
        instr_es_OR ||
        instr_es_SUB ||
        instr_es_ADD ||
        instr_es_SLL ||
        instr_es_SRL
    );

    assign instr_es_tipo_I_A = (
        instr_es_ADDI ||
        // instr_es_JALR ||
        instr_es_LW
    );
    
    assign instr_es_tipo_I_L = (
        instr_es_ANDI ||
        instr_es_ORI
    );

    assign instr_es_tipo_I = (
        instr_es_tipo_I_A ||
        instr_es_tipo_I_L
    );

    assign instr_es_tipo_J = (
        instr_es_JAL
    );

    assign instr_es_tipo_B = (
        instr_es_BEQ
    );

    assign instr_es_tipo_S = (
        instr_es_SW
    );

    assign imm_sel = (
        instr_es_tipo_R ? imm_sel_para_tipo_R :
        instr_es_tipo_I_A ? imm_sel_para_tipo_I_A :
        instr_es_tipo_I_L ? imm_sel_para_tipo_I_L :
        instr_es_tipo_J ? imm_sel_para_tipo_J :
        instr_es_tipo_B ? imm_sel_para_tipo_B :
        instr_es_tipo_S ? imm_sel_para_tipo_S :
        /*Caso defecto */ imm_sel_para_tipo_R
    );

    assign datoA_sel = (
        instr_es_tipo_R ||
        instr_es_tipo_I ||
        instr_es_tipo_S ? datoA_es_rs1 :
        instr_es_tipo_J ||
        instr_es_tipo_B ? datoA_es_pc : datoA_es_rs1
    );

    assign datoB_sel = (
        instr_es_tipo_R ? datoB_es_rs2 :
        instr_es_tipo_I ||
        instr_es_tipo_J ||
        instr_es_tipo_B ||
        instr_es_tipo_S ? datoB_es_imm : datoB_es_rs2
    );

    /* Execute : Cambia ALU_control */
    localparam alu_and = 4'h0;
    localparam alu_or = 4'h1;
    localparam alu_suma = 4'h2;
    localparam alu_resta = 4'h6;
    localparam alu_sll = 4'h8;
    localparam alu_srl = 4'h9;

    wire instr_usa_and;
    wire instr_usa_or;
    wire instr_usa_suma;

    assign instr_usa_and = (
        instr_es_AND ||
        instr_es_ANDI
    );

    assign instr_usa_or = (
        instr_es_OR ||
        instr_es_ORI
    );

    assign instr_usa_suma = (
        instr_es_LW ||
        instr_es_SW ||
        instr_es_ADD ||
        instr_es_ADDI ||
        instr_es_BEQ ||
        // instr_es_JALR ||
        instr_es_JAL
    );
    
    assign ALU_control = (
        instr_usa_suma ? alu_suma :
        instr_usa_and ? alu_and :
        instr_usa_or ? alu_or :
        instr_es_SLL ? alu_sll :
        instr_es_SRL ? alu_srl :
        instr_es_SUB ? alu_resta :
        /*Caso defecto*/ alu_suma
    );

    /* Memory : Cambia dato_rd_sel, WE */
    localparam dato_rd_sel_para_DataIn = 1'b0;
    localparam dato_rd_sel_para_ALUResult = 1'b1;

    assign dato_rd_sel = (
        instr_es_LW ? dato_rd_sel_para_DataIn : dato_rd_sel_para_ALUResult
    );

    assign WE = (estado == st_Memory) ? (instr_es_SW ? 1'b1 : 1'b0) : 1'b0;

    /* Writeback : Cambia PC, WE_banco_de_registros */
    localparam pc_reset = 2'b00;
    localparam pc_hold = 2'b01;
    localparam pc_4 = 2'b10;
    localparam pc_jump = 2'b11;
    
    wire [1:0] pc_para_BEQ;
    wire [1:0] pc_para_writeback;

    assign pc_para_BEQ = (equal == 1'b1) ? pc_jump : pc_4;

    assign pc_para_writeback =
        instr_es_JAL /*|| instr_es_JALR*/ ? pc_jump :
        instr_es_BEQ ? pc_para_BEQ :
        pc_4 // caso general
    ;

    assign PC_sel = (estado == st_Writeback) ? pc_para_writeback : pc_hold;

    assign WE_banco_de_registros = (
        (estado == st_Writeback) && (
        instr_es_LW ||
        instr_es_ADD ||
        instr_es_ADDI ||
        instr_es_OR ||
        instr_es_ORI ||
        instr_es_AND ||
        instr_es_ANDI ||
        instr_es_SUB ||
        instr_es_SLL ||
        instr_es_SRL) ? 1'b1 : 1'b0
    );

endmodule