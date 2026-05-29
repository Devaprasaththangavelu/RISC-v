`timescale 1ns/1ps
module mem_wb_reg(

    input clk,
    input rst,

    input  [31:0] mem_data_in,
    input  [31:0] alu_result_in,

    input  [4:0]  rd_in,

    input         reg_write_in,
    input         wb_sel_in,

    output reg [31:0] mem_data_out,
    output reg [31:0] alu_result_out,

    output reg [4:0]  rd_out,

    output reg        reg_write_out,
    output reg        wb_sel_out

);

always @(posedge clk)
begin
    if(rst) begin

        mem_data_out   <= 0;
        alu_result_out <= 0;

        rd_out         <= 0;

        reg_write_out  <= 0;
        wb_sel_out     <= 0;

    end
    else begin

        mem_data_out   <= mem_data_in;
        alu_result_out <= alu_result_in;

        rd_out         <= rd_in;

        reg_write_out  <= reg_write_in;
        wb_sel_out     <= wb_sel_in;

    end
end

endmodule
