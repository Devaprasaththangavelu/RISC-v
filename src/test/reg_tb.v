`timescale 1ns/1ps

module regfile_tb;

reg clk;
reg we;

reg  [4:0] rs1;
reg  [4:0] rs2;
reg  [4:0] rd;

reg  [31:0] wd;

wire [31:0] rd1;
wire [31:0] rd2;


// DUT
regfile dut(

    .clk(clk),
    .we(we),

    .rs1(rs1),
    .rs2(rs2),
    .rd(rd),

    .wd(wd),

    .rd1(rd1),
    .rd2(rd2)

);


// Clock Generation
always #5 clk = ~clk;


// Waveform Dump
initial begin
    $dumpfile("regfile.vcd");
    $dumpvars(0, regfile_tb);
end


// Test Cases
initial begin

    clk = 0;

    we  = 0;
    rs1 = 0;
    rs2 = 0;
    rd  = 0;
    wd  = 0;

    #10;

    // WRITE x1 = 100
    we = 1;
    rd = 5'd1;
    wd = 32'd100;

    #10;


    // WRITE x2 = 200
    rd = 5'd2;
    wd = 32'd200;

    #10;


    // READ x1 and x2
    we  = 0;

    rs1 = 5'd1;
    rs2 = 5'd2;

    #10;


    // TRY WRITING x0
    we = 1;
    rd = 5'd0;
    wd = 32'd999;

    #10;


    // READ x0
    we  = 0;
    rs1 = 5'd0;

    #10;


    $finish;

end

endmodule
