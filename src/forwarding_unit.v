`timescale 1ns/1ps

module forwarding_unit(

    input       ex_mem_reg_write,
    input       mem_wb_reg_write,

    input [4:0] ex_mem_rd,
    input [4:0] mem_wb_rd,

    input [4:0] id_ex_rs1,
    input [4:0] id_ex_rs2,

    output reg [1:0] forward_a,
    output reg [1:0] forward_b

);

always @(*) begin

    ///////////////////////////////////////////////////////
    // DEFAULT
    ///////////////////////////////////////////////////////

    forward_a = 2'b00;
    forward_b = 2'b00;

    ///////////////////////////////////////////////////////
    // ================================
    // EX/MEM HAZARD (HIGHEST PRIORITY)
    // ================================
    ///////////////////////////////////////////////////////

    if (ex_mem_reg_write && (ex_mem_rd != 0)) begin

        if (ex_mem_rd == id_ex_rs1)
            forward_a = 2'b10;

        if (ex_mem_rd == id_ex_rs2)
            forward_b = 2'b10;

    end

    ///////////////////////////////////////////////////////
    // ================================
    // MEM/WB HAZARD (LOWER PRIORITY)
    // ================================
    ///////////////////////////////////////////////////////

    if (mem_wb_reg_write && (mem_wb_rd != 0)) begin

        // rs1 forwarding
        if ((mem_wb_rd == id_ex_rs1) && !(ex_mem_reg_write && (ex_mem_rd == id_ex_rs1)))
            forward_a = 2'b01;

        // rs2 forwarding
        if ((mem_wb_rd == id_ex_rs2) && !(ex_mem_reg_write && (ex_mem_rd == id_ex_rs2)))
            forward_b = 2'b01;

    end

end

endmodule
