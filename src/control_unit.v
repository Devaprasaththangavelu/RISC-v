`timescale 1ns/1ps

module control_unit (
    input  [6:0] opcode,
    output reg       reg_write,
    output reg       mem_read,
    output reg       mem_write,
    output reg       alu_src,
    output reg       wb_sel,
    output reg       branch,
    output reg [1:0] ALUOp
);

always @(*) begin

    // default values (VERY IMPORTANT for safe design)
    reg_write = 0;
    mem_read  = 0;
    mem_write = 0;
    alu_src   = 0;
    wb_sel    = 0;
    branch    = 0;
    ALUOp     = 2'b00;

    case (opcode)

        // =========================
        // R-TYPE (0110011)
        // =========================
        7'b0110011: begin
            reg_write = 1;
            alu_src   = 0;
            wb_sel    = 0;
            ALUOp     = 2'b10;
        end

        // =========================
        // I-TYPE ALU (0010011)
        // ADDI, ANDI, ORI, etc.
        // =========================
        7'b0010011: begin
            reg_write = 1;
            alu_src   = 1;
            wb_sel    = 0;
            ALUOp     = 2'b11;
        end

        // =========================
        // LOAD (LW) (0000011)
        // =========================
        7'b0000011: begin
            reg_write = 1;
            mem_read  = 1;
            alu_src   = 1;
            wb_sel    = 1;
            ALUOp     = 2'b00;
        end

        // =========================
        // STORE (SW) (0100011)
        // =========================
        7'b0100011: begin
            mem_write = 1;
            alu_src   = 1;
            ALUOp     = 2'b00;
        end

        // =========================
        // BRANCH (BEQ) (1100011)
        // =========================
        7'b1100011: begin
            branch = 1;
            alu_src = 0;
            ALUOp   = 2'b01;
        end

        default: begin
            // safe defaults already applied
        end

    endcase

end

endmodule
