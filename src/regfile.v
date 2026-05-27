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

    regs[0] = 32'd0;
    regs[1] = 32'd20;
    regs[2] = 32'd10;

end


// ======================================================
// ASYNCHRONOUS READ
// ======================================================

assign rd1 = regs[rs1];

assign rd2 = regs[rs2];


// ======================================================
// SYNCHRONOUS WRITE
// ======================================================

always @(posedge clk) begin

    if(we && rd != 5'b00000)
        regs[rd] <= wd;

    regs[0] <= 32'b0;

end

endmodule
