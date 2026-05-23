`timescale 1ns/1ps

module riscv_top_tb;

reg clk;
reg rst;

riscv_top dut(

.clk(clk),
.rst(rst)

);


// Clock
always #5 clk = ~clk;


// Test
initial begin

    clk = 0;
    rst = 1;

    #10;
    rst = 0;


    // preload registers
    dut.uut5.regs[1] = 32'd20;
    dut.uut5.regs[2] = 32'd30;


    #50;

    $display("x3 = %d", dut.uut5.regs[3]);

    $finish;

end


// waveform dump
initial begin

    $dumpfile("cpu.vcd");
    $dumpvars(0, riscv_top_tb);

end

endmodule
