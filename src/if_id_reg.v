`timescale 1ns/1ps
module if_id_reg(
    input clk,
    input rst,
    input if_id_write,
    input  [31:0] pc_in,
    input  [31:0] instr_in,
    input flush,
    output reg [31:0] pc_out,
    output reg [31:0] instr_out
);

always @(posedge clk) begin
    if(rst) begin
        pc_out    <= 32'b0;
        instr_out <= 32'b0;
    end
    else if(flush)
      begin
        instr_out <= 32'b0;
        pc_out    <= 32'b0;
      end

    else if(if_id_write)
      begin
        instr_out <= instr_in;
        pc_out    <= pc_in;

      end
end

endmodule
