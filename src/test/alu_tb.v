`timescale 1ns/1ps

module alu_tb;

reg  [31:0] a;
reg  [31:0] b;
reg  [3:0] sel;

wire [31:0] c;

alu dut(
    .a(a),
    .b(b),
    .sel(sel),
    .c(c)
);


// Dump waveform
initial begin
    $dumpfile("alu.vcd");
    $dumpvars(0, alu_tb);
end


// Test cases
initial begin

    // ADD
    a   = 32'd10;
    b   = 32'd20;
    sel = 4'b0000;
    #10;

    // SUB
    a   = 32'd30;
    b   = 32'd10;
    sel = 4'b0001;
    #10;

    // AND
    a   = 32'h11001100;
    b   = 32'h10101010;
    sel = 4'b0010;
    #10;

    // OR
    sel = 4'b0011;
    #10;

    // XOR
    sel = 4'b0100;
    #10;

    // NOT
    a   = 32'h11110000;
    sel = 4'b0101;
    #10;

    // EQUAL
    a   = 32'd15;
    b   = 32'd15;
    sel = 4'b0110;
    #10;

    // LESS THAN
    a   = 32'd5;
    b   = 32'd10;
    sel = 4'b0111;
    #10;

    // LEFT SHIFT
    a   = 32'h00001111;
    sel = 4'b1000;
    #10;

    // RIGHT SHIFT
    sel = 4'b1001;
    #10;

    $finish;

end

endmodule
