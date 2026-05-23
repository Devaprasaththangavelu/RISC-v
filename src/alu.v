`timescale 1ns/1ps
module alu(

input  [31:0] a,
input  [31:0] b,
input  [3:0] sel,
output reg [31:0] c
);

always @(*) begin

    case(sel)

    4'b0000: c = a + b;
    4'b0001: c = a - b;
    4'b0010: c = a & b;
    4'b0011: c = a | b;
    4'b0100: c = a ^ b;
   
    4'b0111: c = (a < b) ? 32'h00000001 : 32'h00000000;

    4'b1000: c = a << 1;

    4'b1001: c = a >> 1;

    default: c = 32'h00000000;

    endcase

end

endmodule
