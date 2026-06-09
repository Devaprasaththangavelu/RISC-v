
`timescale 1ns/1ps

module pipeline_top(

    input clk,
    input rst

);

///////////////////////////////////////////////////////////
// FETCH STAGE WIRES
///////////////////////////////////////////////////////////

wire [31:0] pc;
wire [31:0] pc_next;
wire [31:0] instruction;

wire        pc_write;

///////////////////////////////////////////////////////////
// IF/ID WIRES
///////////////////////////////////////////////////////////

wire [31:0] if_id_pc;
wire [31:0] if_id_instr;

wire        if_id_write;

///////////////////////////////////////////////////////////
// DECODE STAGE WIRES
///////////////////////////////////////////////////////////

wire [6:0] opcode;
wire [2:0] funct3;
wire [6:0] funct7;

wire [4:0] rs1;
wire [4:0] rs2;
wire [4:0] rd;

wire [31:0] rs1_data;
wire [31:0] rs2_data;

wire [31:0] imm_out;

///////////////////////////////////////////////////////////
// CONTROL SIGNALS
///////////////////////////////////////////////////////////

wire        reg_write;
wire        mem_read;
wire        mem_write;
wire        alu_src;
wire        mem_to_reg;
wire        branch;

wire [1:0] ALUOp;
wire [3:0] alu_sel;

///////////////////////////////////////////////////////////
// STALL CONTROL WIRES
///////////////////////////////////////////////////////////

wire        control_sel;

wire        stall_reg_write;
wire        stall_mem_read;
wire        stall_mem_write;
wire        stall_alu_src;
wire        stall_mem_to_reg;
wire        stall_branch;

wire [1:0]  stall_ALUOp;

///////////////////////////////////////////////////////////
// ID/EX WIRES
///////////////////////////////////////////////////////////

wire [31:0] id_ex_pc;
wire [31:0] id_ex_rs1_data;
wire [31:0] id_ex_rs2_data;
wire [31:0] id_ex_imm;

wire [4:0]  id_ex_rs1;
wire [4:0]  id_ex_rs2;
wire [4:0]  id_ex_rd;

wire        id_ex_reg_write;
wire        id_ex_mem_read;
wire        id_ex_mem_write;
wire        id_ex_alu_src;
wire        id_ex_mem_to_reg;
wire        id_ex_branch;

wire [3:0]  id_ex_alu_sel;

///////////////////////////////////////////////////////////
// FORWARDING WIRES
///////////////////////////////////////////////////////////

wire [1:0]  forward_a;
wire [1:0]  forward_b;

wire [31:0] forwarded_rs1;
wire [31:0] forwarded_rs2;

///////////////////////////////////////////////////////////
// EXECUTE STAGE WIRES
///////////////////////////////////////////////////////////

wire [31:0] alu_b;
wire [31:0] alu_result;

wire        zero;

wire        branch_taken;
wire [31:0] branch_target;

wire        flush;

///////////////////////////////////////////////////////////
// EX/MEM WIRES
///////////////////////////////////////////////////////////

wire [31:0] ex_mem_alu_result;
wire [31:0] ex_mem_rs2_data;

wire [4:0]  ex_mem_rd;

wire        ex_mem_reg_write;
wire        ex_mem_mem_read;
wire        ex_mem_mem_write;
wire        ex_mem_mem_to_reg;

///////////////////////////////////////////////////////////
// MEMORY STAGE WIRES
///////////////////////////////////////////////////////////

wire [31:0] mem_data;

///////////////////////////////////////////////////////////
// MEM/WB WIRES
///////////////////////////////////////////////////////////

wire [31:0] mem_wb_mem_data;
wire [31:0] mem_wb_alu_result;

wire [4:0]  mem_wb_rd;

wire        mem_wb_reg_write;
wire        mem_wb_mem_to_reg;

///////////////////////////////////////////////////////////
// WRITEBACK WIRES
///////////////////////////////////////////////////////////

wire [31:0] wb_data;

///////////////////////////////////////////////////////////
// FETCH STAGE
///////////////////////////////////////////////////////////

program_counter u_pc (

    .clk(clk),
    .rst(rst),

    .pc_next(pc_next),

    .pc(pc),

    .pc_write(pc_write)

);

assign pc_next = (branch_taken) ? branch_target : (pc + 4);

inst_mem u_imem (

    .addr(pc),

    .inst(instruction)

);

///////////////////////////////////////////////////////////
// IF/ID PIPELINE REGISTER
///////////////////////////////////////////////////////////

if_id_reg u_if_id (

    .clk(clk),
    .rst(rst),

    .flush(flush),

    .if_id_write(if_id_write),

    .pc_in(pc),
    .instr_in(instruction),

    .pc_out(if_id_pc),
    .instr_out(if_id_instr)

);

///////////////////////////////////////////////////////////
// INSTRUCTION DECODE
///////////////////////////////////////////////////////////

assign opcode = if_id_instr[6:0];
assign rd     = if_id_instr[11:7];
assign funct3 = if_id_instr[14:12];
assign rs1    = if_id_instr[19:15];
assign rs2    = if_id_instr[24:20];
assign funct7 = if_id_instr[31:25];

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
// HAZARD DETECTION UNIT
///////////////////////////////////////////////////////////

hazard_detection_unit u_hazard (

    .id_ex_mem_read(id_ex_mem_read),
    .id_ex_rd(id_ex_rd),

    .rs1(rs1),
    .rs2(rs2),

    .pc_write(pc_write),
    .if_id_write(if_id_write),

    .control_sel(control_sel)

);

///////////////////////////////////////////////////////////
// STALL LOGIC
///////////////////////////////////////////////////////////

assign stall_reg_write  = (control_sel) ? 1'b0  : reg_write;
assign stall_mem_read   = (control_sel) ? 1'b0  : mem_read;
assign stall_mem_write  = (control_sel) ? 1'b0  : mem_write;
assign stall_alu_src    = (control_sel) ? 1'b0  : alu_src;
assign stall_mem_to_reg = (control_sel) ? 1'b0  : mem_to_reg;
assign stall_branch     = (control_sel) ? 1'b0  : branch;

assign stall_ALUOp      = (control_sel) ? 2'b00 : ALUOp;

///////////////////////////////////////////////////////////
// ALU CONTROL
///////////////////////////////////////////////////////////

alu_control u_alu_control (

    .ALUOp(stall_ALUOp),

    .funct3(funct3),
    .funct7(funct7),

    .alu_sel(alu_sel)

);

///////////////////////////////////////////////////////////
// ID/EX PIPELINE REGISTER
///////////////////////////////////////////////////////////

id_ex_reg u_id_ex (

    .clk(clk),
    .rst(rst),

   .flush(flush),
    
    .pc_in(if_id_pc),

    .rs1_data_in(rs1_data),
    .rs2_data_in(rs2_data),

    .rs1_in(rs1),
    .rs2_in(rs2),

    .imm_in(imm_out),

    .rd_in(rd),

    .branch_in(stall_branch),

    .reg_write_in(stall_reg_write),
    .mem_read_in(stall_mem_read),
    .mem_write_in(stall_mem_write),
    .alu_src_in(stall_alu_src),
    .wb_sel_in(stall_mem_to_reg),

    .alu_sel_in(alu_sel),

    .pc_out(id_ex_pc),

    .rs1_data_out(id_ex_rs1_data),
    .rs2_data_out(id_ex_rs2_data),

    .rs1_out(id_ex_rs1),
    .rs2_out(id_ex_rs2),

    .imm_out(id_ex_imm),

    .rd_out(id_ex_rd),

    .branch_out(id_ex_branch),

    .reg_write_out(id_ex_reg_write),
    .mem_read_out(id_ex_mem_read),
    .mem_write_out(id_ex_mem_write),
    .alu_src_out(id_ex_alu_src),
    .wb_sel_out(id_ex_mem_to_reg),

    .alu_sel_out(id_ex_alu_sel)

);

///////////////////////////////////////////////////////////
// FORWARDING UNIT
///////////////////////////////////////////////////////////

forwarding_unit u_forwarding (

    .ex_mem_reg_write(ex_mem_reg_write),
    .mem_wb_reg_write(mem_wb_reg_write),

    .ex_mem_rd(ex_mem_rd),
    .mem_wb_rd(mem_wb_rd),

    .id_ex_rs1(id_ex_rs1),
    .id_ex_rs2(id_ex_rs2),

    .forward_a(forward_a),
    .forward_b(forward_b)

);

///////////////////////////////////////////////////////////
// FORWARDING MUX A
///////////////////////////////////////////////////////////

forwarding_mux u_forward_mux_a (

    .rs(id_ex_rs1_data),

    .ex_out(ex_mem_alu_result),

    .wb_out(wb_data),

    .sel(forward_a),

    .operand(forwarded_rs1)

);

///////////////////////////////////////////////////////////
// FORWARDING MUX B
///////////////////////////////////////////////////////////

forwarding_mux u_forward_mux_b (

    .rs(id_ex_rs2_data),

    .ex_out(ex_mem_alu_result),

    .wb_out(wb_data),

    .sel(forward_b),

    .operand(forwarded_rs2)

);

///////////////////////////////////////////////////////////
// BRANCH LOGIC
///////////////////////////////////////////////////////////

assign branch_taken  = id_ex_branch && (forwarded_rs1 == forwarded_rs2);

assign branch_target = id_ex_pc + id_ex_imm;

//assign flush = branch_taken;
// FIX - branch resolves in ID using register file outputs directly
//assign branch_taken  = branch && (rs1_data == rs2_data);
//assign branch_target = if_id_pc + imm_out;
//assign flush = branch_taken;
// Do not flush the pipeline if we are actively stalling the ID stage!
assign flush = branch_taken && (!control_sel);
///////////////////////////////////////////////////////////
// ALU INPUT MUX
///////////////////////////////////////////////////////////

alu_mux u_alu_mux (

    .rs2(forwarded_rs2),

    .imm(id_ex_imm),

    .alu_src(id_ex_alu_src),

    .alu_b(alu_b)

);

///////////////////////////////////////////////////////////
// ALU
///////////////////////////////////////////////////////////

alu u_alu (

    .a(forwarded_rs1),

    .b(alu_b),

    .sel(id_ex_alu_sel),

    .zero(zero),

    .c(alu_result)

);

///////////////////////////////////////////////////////////
// EX/MEM PIPELINE REGISTER
///////////////////////////////////////////////////////////

ex_mem_reg u_ex_mem (

    .clk(clk),
    .rst(rst),

    .alu_result_in(alu_result),

    .rs2_data_in(forwarded_rs2),  
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
// DATA MEMORY
///////////////////////////////////////////////////////////

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
// WRITEBACK MUX
///////////////////////////////////////////////////////////

wb_mux u_wb (

    .alu_result(mem_wb_alu_result),

    .mem_data(mem_wb_mem_data),

    .wb_sel(mem_wb_mem_to_reg),

    .wb_data(wb_data)

);

endmodule


