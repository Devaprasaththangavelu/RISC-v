`timescale 1ns/1ps

module regfile(

input clk,
input we,

input  [4:0] rs1,
input  [4:0] rs2,
input  [4:0] rd,

input  [31:0] wd,

output [31:0] rd1,
output [31:0] rd2

);

// ======================================================
// REGISTER ARRAY
// ======================================================

reg [31:0] regs [0:31];


// ======================================================
// INITIAL VALUES (FOR SIMULATION)
// ======================================================

initial begin
    integer i;
    for(i = 0; i < 32; i = i + 1)
        regs[i] = 32'd0;
end

// ======================================================
// ASYNCHRONOUS READ
// ======================================================

//assign rd1 = regs[rs1];

//assign rd2 = regs[rs2];

// ASYNCHRONOUS READ WITH WRITE-THROUGH
assign rd1 = (we && rd == rs1 && rd != 0) ? wd : regs[rs1];
assign rd2 = (we && rd == rs2 && rd != 0) ? wd : regs[rs2];
// ======================================================
// SYNCHRONOUS WRITE
// ======================================================

always @(posedge clk) begin

    if(we && rd != 5'b00000)
        regs[rd] <= wd;

    regs[0] <= 32'b0;

end

endmodule
