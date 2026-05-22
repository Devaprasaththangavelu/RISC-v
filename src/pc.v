`timescale 1ns/1ps
module pc(

input clk,
input rst,

input  [31:0] pc_next,

output reg [31:0] program_counter

);

always @(posedge clk) begin

    if(rst)
        program_counter <= 32'b0;

    else
        program_counter <= pc_next;

end

endmodule
