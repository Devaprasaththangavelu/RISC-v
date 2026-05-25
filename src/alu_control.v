`timescale 1ns/1ps

module alu_control (
    input  [1:0] ALUOp,
    input  [2:0] funct3,
    input  [6:0] funct7,

    output reg [3:0] alu_sel
);

always @(*) begin

    // default
    alu_sel = 4'b0000;

    case (ALUOp)

        // =========================
        // LOAD / STORE → ADD
        // =========================
        2'b00: begin
            alu_sel = 4'b0000; // ADD
        end

        // =========================
        // BRANCH → SUB (compare)
        // =========================
        2'b01: begin
            alu_sel = 4'b0001; // SUB
        end

        // =========================
        // R-TYPE
        // =========================
        2'b10: begin

            case ({funct7, funct3})

                // ADD
                10'b0000000_000: alu_sel = 4'b0000;

                // SUB
                10'b0100000_000: alu_sel = 4'b0001;

                // AND
                10'b0000000_111: alu_sel = 4'b0010;

                // OR
                10'b0000000_110: alu_sel = 4'b0011;

                // XOR
                10'b0000000_100: alu_sel = 4'b0100;

                // SLT
                10'b0000000_010: alu_sel = 4'b0111;

                // SLL
                10'b0000000_001: alu_sel = 4'b1000;

                // SRL
                10'b0000000_101: alu_sel = 4'b1001;

                default: alu_sel = 4'b0000;

            endcase
        end

        // =========================
        // I-TYPE ALU (ADDI, ANDI, ORI)
        // =========================
        2'b11: begin

            case (funct3)

                // ADDI
                3'b000: alu_sel = 4'b0000;

                // SLTI
                3'b010: alu_sel = 4'b0111;

                // XORI
                3'b100: alu_sel = 4'b0100;

                // ORI
                3'b110: alu_sel = 4'b0011;

                // ANDI
                3'b111: alu_sel = 4'b0010;

                default: alu_sel = 4'b0000;

            endcase
        end

        default: begin
            alu_sel = 4'b0000;
        end

    endcase

end

endmodule
