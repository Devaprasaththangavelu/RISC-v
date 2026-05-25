`timescale 1ns/1ps

module inst_mem (

    input  [31:0] addr,
    output [31:0] inst

);

    // 256 x 32-bit instruction memory (1KB)
    reg [31:0] inst_memory [0:255];

    // =========================
    // BOOTLOADER STYLE INIT
    // =========================
    initial begin
        $readmemh("program.hex", inst_memory);
    end

    // =========================
    // INSTRUCTION FETCH
    // =========================
    assign inst = inst_memory[addr[9:2]];

endmodule
