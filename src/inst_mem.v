`timescale 1ns/1ps
module inst_mem(
input [31:0] addr,
output reg [31:0] inst
);


reg [31:0] inst_memory [0:255];

assign inst = inst_memory[addr[9:2]];

endmodule



