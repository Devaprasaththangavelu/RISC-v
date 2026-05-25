`timescale 1ns/1ps
module alu_mux (
    input  [31:0] rs2,
    input  [31:0] imm,
    input   alu_src,
    output [31:0] alu_b
);

assign alu_b = (alu_src) ? imm : rs2;

endmodule
