`timescale 1ns/1ps
module inst_mem(

input [31:0] addr,

output [31:0] inst

);

reg [31:0] inst_memory [0:255];


// preload instructions
initial begin

    // ADD x3,x1,x2
    inst_memory[0] = 32'h002081B3;

    // SUB x4,x1,x2
    inst_memory[1] = 32'h40208233;

    // AND x5,x1,x2
    inst_memory[2] = 32'h0020F2B3;

    // OR x6,x1,x2
    inst_memory[3] = 32'h0020E333;

    // XOR x7,x1,x2
    inst_memory[4] = 32'h0020C3B3;

    // ADDI x8,x1,10
    inst_memory[5] = 32'h00A08413;

end


assign inst = inst_memory[addr[9:2]];

endmodule
