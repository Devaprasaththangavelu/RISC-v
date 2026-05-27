`timescale 1ns/1ps

module riscv_top(

input clk,
input rst

);

// ======================================================
// INTERNAL WIRES
// ======================================================

wire [31:0] instruction;

wire [6:0] opcode;
wire [2:0] funct3;
wire [6:0] funct7;

wire [4:0] rs1;
wire [4:0] rs2;
wire [4:0] rd;

wire [31:0] a;
wire [31:0] reg_b;

wire [31:0] imm_out;

wire [31:0] alu_b;
wire [31:0] alu_result;

wire [31:0] mem_data;
wire [31:0] wb_data;

wire [31:0] pc;
wire [31:0] pc_next;

wire reg_write;
wire mem_read;
wire mem_write;
wire alu_src;
wire mem_to_reg;
wire branch;
wire zero;
wire [1:0] ALUOp;
wire [3:0] alu_sel;


// ======================================================
// INSTRUCTION DECODE
// ======================================================

assign opcode = instruction[6:0];

assign rd     = instruction[11:7];

assign funct3 = instruction[14:12];

assign rs1    = instruction[19:15];

assign rs2    = instruction[24:20];

assign funct7 = instruction[31:25];


// ======================================================
// PC NEXT LOGIC
// ======================================================

pc_next_logic u_pcn (

    .pc(pc),
    .imm(imm_out),
    .branch(branch),
    .zero(zero),
    .pc_next(pc_next)

);


// ======================================================
// PROGRAM COUNTER
// ======================================================

program_counter u_pc (

    .clk(clk),
    .rst(rst),
    .pc_next(pc_next),
    .pc(pc)

);


// ======================================================
// INSTRUCTION MEMORY
// ======================================================

inst_mem u_imem (

    .addr(pc),
    .inst(instruction)

);


// ======================================================
// CONTROL UNIT
// ======================================================

control_unit u_ctrl (

    .opcode(opcode),

    .reg_write(reg_write),
    .mem_read(mem_read),
    .mem_write(mem_write),
    .alu_src(alu_src),
    .wb_sel(mem_to_reg),
    .branch(branch),
    .ALUOp(ALUOp)

);


// ======================================================
// REGISTER FILE
// ======================================================

regfile u_rf (

    .clk(clk),
    .we(reg_write),

    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),

    .wd(wb_data),

    .rd1(a),
    .rd2(reg_b)

);


// ======================================================
// IMMEDIATE GENERATOR
// ======================================================

immediate_generator u_imm_gen (

    .instruction(instruction),
    .imm_out(imm_out)

);


// ======================================================
// ALU CONTROL
// ======================================================

alu_control u_alu_control (

    .ALUOp(ALUOp),
    .funct3(funct3),
    .funct7(funct7),

    .alu_sel(alu_sel)

);


// ======================================================
// ALU INPUT MUX
// ======================================================

alu_mux u_alu_mux (

    .rs2(reg_b),
    .imm(imm_out),
    .alu_src(alu_src),

    .alu_b(alu_b)


);


// ======================================================
// ALU
// ======================================================

alu u_alu (

    .a(a),
    .b(alu_b),

    .sel(alu_sel),
    .zero(zero),
    .c(alu_result)

);


// ======================================================
// DATA MEMORY
// ======================================================

data_mem u_dmem (

    .clk(clk),

    .we(mem_write),
    .re(mem_read),

    .addr(alu_result),

    .write_data(reg_b),

    .read_data(mem_data)

);


// ======================================================
// WRITEBACK MUX
// ======================================================

wb_mux u_wb (

    .alu_result(alu_result),
    .mem_data(mem_data),

    .wb_sel(mem_to_reg),

    .wb_data(wb_data)

);

endmodule
