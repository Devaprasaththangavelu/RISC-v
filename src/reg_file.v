`timescale 1ns/1ps

module regfile(
input clk,we,
input [4:0]rs1,
input [4:0]rs2,
input [4:0] rd,
input [31:0]wd,
output reg[31:0] rd1,
output reg[31:0] rd2
);

reg [31:0] regs [0:31];

assign rd1 = regs[rs1];
assign rd2 = regs[rs2];

always @(posedge clk)
begin
  if(we && rd != 5'b00000)
        regs[rd] <= wd;

    regs[0] <= 32'b0;

end
endmodule
