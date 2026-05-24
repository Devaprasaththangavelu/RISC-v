`timescale 1ns/1ps
module immediate_generator(

input [31:0] instruction,
output  reg [31:0] imm_out

);

wire [11:0] imm_temp;

assign imm_temp = instruction[31:20];

always @(*) begin
    imm_out = {{20{imm_temp[11]}}, imm_temp};
end
endmodule
