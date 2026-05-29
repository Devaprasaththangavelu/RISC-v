`timescale 1ns/1ps

module pipeline_top(

    input clk,
    input rst

);

///////////////////////////////////////////////////////////
// FETCH STAGE
///////////////////////////////////////////////////////////

wire [31:0] pc;
wire [31:0] pc_next;
wire [31:0] instruction;

program_counter u_pc (

    .clk(clk),
    .rst(rst),
    .pc_next(pc_next),
    .pc(pc)

);

assign pc_next = pc + 4;

inst_mem u_imem (

    .addr(pc),
    .inst(instruction)

);

///////////////////////////////////////////////////////////
// IF/ID PIPELINE REGISTER
///////////////////////////////////////////////////////////

wire [31:0] if_id_pc;
wire [31:0] if_id_instr;

if_id_reg u_if_id (

    .clk(clk),
    .rst(rst),

    .pc_in(pc),
    .instr_in(instruction),

    .pc_out(if_id_pc),
    .instr_out(if_id_instr)

);

///////////////////////////////////////////////////////////
// DECODE STAGE
///////////////////////////////////////////////////////////

wire [6:0] opcode;
wire [2:0] funct3;
wire [6:0] funct7;

wire [4:0] rs1;
wire [4:0] rs2;
wire [4:0] rd;

assign opcode = if_id_instr[6:0];
assign rd     = if_id_instr[11:7];
assign funct3 = if_id_instr[14:12];
assign rs1    = if_id_instr[19:15];
assign rs2    = if_id_instr[24:20];
assign funct7 = if_id_instr[31:25];

wire [31:0] rs1_data;
wire [31:0] rs2_data;

wire [31:0] imm_out;

wire reg_write;
wire mem_read;
wire mem_write;
wire alu_src;
wire mem_to_reg;
wire branch;

wire [1:0] ALUOp;
wire [3:0] alu_sel;

///////////////////////////////////////////////////////////
// CONTROL UNIT
///////////////////////////////////////////////////////////

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

///////////////////////////////////////////////////////////
// REGISTER FILE
///////////////////////////////////////////////////////////

wire [4:0] mem_wb_rd;
wire       mem_wb_reg_write;

wire [31:0] wb_data;

regfile u_rf (

    .clk(clk),

    .we(mem_wb_reg_write),

    .rs1(rs1),
    .rs2(rs2),

    .rd(mem_wb_rd),

    .wd(wb_data),

    .rd1(rs1_data),
    .rd2(rs2_data)

);

///////////////////////////////////////////////////////////
// IMMEDIATE GENERATOR
///////////////////////////////////////////////////////////

immediate_generator u_imm_gen (

    .instruction(if_id_instr),
    .imm_out(imm_out)

);

///////////////////////////////////////////////////////////
// ALU CONTROL
///////////////////////////////////////////////////////////

alu_control u_alu_control (

    .ALUOp(ALUOp),
    .funct3(funct3),
    .funct7(funct7),

    .alu_sel(alu_sel)

);

///////////////////////////////////////////////////////////
// ID/EX PIPELINE REGISTER
///////////////////////////////////////////////////////////

wire [31:0] id_ex_pc;
wire [31:0] id_ex_rs1_data;
wire [31:0] id_ex_rs2_data;
wire [31:0] id_ex_imm;

wire [4:0]  id_ex_rd;

wire        id_ex_reg_write;
wire        id_ex_mem_read;
wire        id_ex_mem_write;
wire        id_ex_alu_src;
wire        id_ex_mem_to_reg;

wire [3:0]  id_ex_alu_sel;

id_ex_reg u_id_ex (

    .clk(clk),
    .rst(rst),

    .pc_in(if_id_pc),

    .rs1_data_in(rs1_data),
    .rs2_data_in(rs2_data),

    .imm_in(imm_out),

    .rd_in(rd),

    .reg_write_in(reg_write),
    .mem_read_in(mem_read),
    .mem_write_in(mem_write),
    .alu_src_in(alu_src),
    .wb_sel_in(mem_to_reg),

    .alu_sel_in(alu_sel),

    .pc_out(id_ex_pc),

    .rs1_data_out(id_ex_rs1_data),
    .rs2_data_out(id_ex_rs2_data),

    .imm_out(id_ex_imm),

    .rd_out(id_ex_rd),

    .reg_write_out(id_ex_reg_write),
    .mem_read_out(id_ex_mem_read),
    .mem_write_out(id_ex_mem_write),
    .alu_src_out(id_ex_alu_src),
    .wb_sel_out(id_ex_mem_to_reg),

    .alu_sel_out(id_ex_alu_sel)

);

///////////////////////////////////////////////////////////
// EXECUTE STAGE
///////////////////////////////////////////////////////////

wire [31:0] alu_b;
wire [31:0] alu_result;
wire zero;

alu_mux u_alu_mux (

    .rs2(id_ex_rs2_data),
    .imm(id_ex_imm),

    .alu_src(id_ex_alu_src),

    .alu_b(alu_b)

);

alu u_alu (

    .a(id_ex_rs1_data),
    .b(alu_b),

    .sel(id_ex_alu_sel),

    .zero(zero),
    .c(alu_result)

);

///////////////////////////////////////////////////////////
// EX/MEM PIPELINE REGISTER
///////////////////////////////////////////////////////////

wire [31:0] ex_mem_alu_result;
wire [31:0] ex_mem_rs2_data;

wire [4:0]  ex_mem_rd;

wire        ex_mem_reg_write;
wire        ex_mem_mem_read;
wire        ex_mem_mem_write;
wire        ex_mem_mem_to_reg;

ex_mem_reg u_ex_mem (

    .clk(clk),
    .rst(rst),

    .alu_result_in(alu_result),
    .rs2_data_in(id_ex_rs2_data),

    .rd_in(id_ex_rd),

    .reg_write_in(id_ex_reg_write),
    .mem_read_in(id_ex_mem_read),
    .mem_write_in(id_ex_mem_write),
    .wb_sel_in(id_ex_mem_to_reg),

    .alu_result_out(ex_mem_alu_result),
    .rs2_data_out(ex_mem_rs2_data),

    .rd_out(ex_mem_rd),

    .reg_write_out(ex_mem_reg_write),
    .mem_read_out(ex_mem_mem_read),
    .mem_write_out(ex_mem_mem_write),
    .wb_sel_out(ex_mem_mem_to_reg)

);

///////////////////////////////////////////////////////////
// MEMORY STAGE
///////////////////////////////////////////////////////////

wire [31:0] mem_data;

data_mem u_dmem (

    .clk(clk),

    .we(ex_mem_mem_write),
    .re(ex_mem_mem_read),

    .addr(ex_mem_alu_result),

    .write_data(ex_mem_rs2_data),

    .read_data(mem_data)

);

///////////////////////////////////////////////////////////
// MEM/WB PIPELINE REGISTER
///////////////////////////////////////////////////////////

wire [31:0] mem_wb_mem_data;
wire [31:0] mem_wb_alu_result;

wire        mem_wb_mem_to_reg;

mem_wb_reg u_mem_wb (

    .clk(clk),
    .rst(rst),

    .mem_data_in(mem_data),
    .alu_result_in(ex_mem_alu_result),

    .rd_in(ex_mem_rd),

    .reg_write_in(ex_mem_reg_write),
    .wb_sel_in(ex_mem_mem_to_reg),

    .mem_data_out(mem_wb_mem_data),
    .alu_result_out(mem_wb_alu_result),

    .rd_out(mem_wb_rd),

    .reg_write_out(mem_wb_reg_write),
    .wb_sel_out(mem_wb_mem_to_reg)

);

///////////////////////////////////////////////////////////
// WRITEBACK STAGE
///////////////////////////////////////////////////////////

wb_mux u_wb (

    .alu_result(mem_wb_alu_result),
    .mem_data(mem_wb_mem_data),

    .wb_sel(mem_wb_mem_to_reg),

    .wb_data(wb_data)

);

endmodule


