`timescale 1ns/1ps

module pc_next_logic (

    input  [31:0] pc,
    input  [31:0] imm,
    input          branch,
    input          zero,

    output reg [31:0] pc_next

);

always @(*) begin

    // default: sequential execution
    pc_next = pc + 4;

    // branch decision (BEQ)
    if (branch && zero) begin
        pc_next = pc + imm;
    end

end

endmodule
