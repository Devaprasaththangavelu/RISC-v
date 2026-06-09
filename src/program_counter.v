`timescale 1ns/1ps
module program_counter(

input clk,
input rst,
input pc_write,
input  [31:0] pc_next,

output reg [31:0] pc

);

always @(posedge clk) begin

    if(rst)
        pc <= 32'b0;

    else if(pc_write)
    pc <= pc_next;
    else
    pc <= pc;
end

endmodule
