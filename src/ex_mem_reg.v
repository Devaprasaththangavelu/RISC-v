`timescale 1ns/1ps
module ex_mem_reg(

    input clk,
    input rst,

    input  [31:0] alu_result_in,
    input  [31:0] rs2_data_in,

    input  [4:0]  rd_in,

    input         reg_write_in,
    input         mem_read_in,
    input         mem_write_in,
    input         wb_sel_in,

    output reg [31:0] alu_result_out,
    output reg [31:0] rs2_data_out,

    output reg [4:0]  rd_out,

    output reg        reg_write_out,
    output reg        mem_read_out,
    output reg        mem_write_out,
    output reg        wb_sel_out

);

always @(posedge clk)
begin
    if(rst) begin

        alu_result_out <= 0;
        rs2_data_out   <= 0;

        rd_out         <= 0;

        reg_write_out  <= 0;
        mem_read_out   <= 0;
        mem_write_out  <= 0;
        wb_sel_out     <= 0;

    end
    else begin

        alu_result_out <= alu_result_in;
        rs2_data_out   <= rs2_data_in;

        rd_out         <= rd_in;

        reg_write_out  <= reg_write_in;
        mem_read_out   <= mem_read_in;
        mem_write_out  <= mem_write_in;
        wb_sel_out     <= wb_sel_in;

    end
end

endmodule
