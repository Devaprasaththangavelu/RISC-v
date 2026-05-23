`timescale 1ns/1ps
module control_unit(

input  [6:0] opcode,
input  [2:0] funct3,
input  [6:0] funct7,

output reg [3:0] alu_sel,
output reg       reg_write

);

always @(*) begin

    // default values
    alu_sel   = 4'b0000;
    reg_write = 1'b0;

    case(opcode)

        // R-Type Instructions
        7'b0110011: begin

            reg_write = 1'b1;

            case({funct7,funct3})

                // ADD
                10'b0000000_000:
                    alu_sel = 4'b0000;

                // SUB
                10'b0100000_000:
                    alu_sel = 4'b0001;

                // AND
                10'b0000000_111:
                    alu_sel = 4'b0010;

                // OR
                10'b0000000_110:
                    alu_sel = 4'b0011;

                // XOR
                10'b0000000_100:
                    alu_sel = 4'b0100;

                // SLT
                10'b0000000_010:
                    alu_sel = 4'b0111;

                // SLL
                10'b0000000_001:
                    alu_sel = 4'b1000;

                // SRL
                10'b0000000_101:
                    alu_sel = 4'b1001;

                default:
                    alu_sel = 4'b0000;

            endcase

        end

        default: begin

            alu_sel   = 4'b0000;
            reg_write = 1'b0;

        end

    endcase

end

endmodule
