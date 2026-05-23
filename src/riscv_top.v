`timescale 1ns/1ps
module riscv_top(

input clk,
input rst

/*// external register initialization
input        ext_we,
input [4:0]  ext_addr,
input [31:0] ext_data
*/
);


// ----------------------
// Internal Wires
// ----------------------

wire [31:0] instruction;

wire [6:0] opcode;
wire [2:0] funct3;
wire [6:0] funct7;

wire [4:0] rs1;
wire [4:0] rs2;
wire [4:0] rd;

wire [31:0] a;
wire [31:0] b;

wire [31:0] alu_result;

wire reg_write;
wire [3:0] alu_sel;

wire [31:0] pc;

wire [31:0] pc_next;


// ----------------------
// Instruction Decode
// ----------------------

assign opcode = instruction[6:0];

assign rd     = instruction[11:7];

assign funct3 = instruction[14:12];

assign rs1    = instruction[19:15];

assign rs2    = instruction[24:20];

assign funct7 = instruction[31:25];


// ----------------------
// PC Logic
// ----------------------

assign pc_next = pc + 4;


// ----------------------
// Program Counter
// ----------------------

program_counter uut1(

.clk(clk),
.rst(rst),
.pc_next(pc_next),
.pc(pc)

);


// ----------------------
// Control Unit
// ----------------------

control_unit uut2(

.opcode(opcode),
.funct3(funct3),
.funct7(funct7),

.reg_write(reg_write),
.alu_sel(alu_sel)

);


// ----------------------
// ALU
// ----------------------

alu uut3(

.a(a),
.b(b),

.sel(alu_sel),

.c(alu_result)

);


// ----------------------
// Instruction Memory
// ----------------------

inst_mem uut4(

.addr(pc),

.inst(instruction)

);


// ----------------------
// Register File
// ----------------------

regfile uut5(

.clk(clk),

.we(reg_write),

.rs1(rs1),
.rs2(rs2),

.rd(rd),

.wd(alu_result),

.rd1(a),
.rd2(b)

);

endmodule
