`timescale 1ns/1ps

module pipeline_top_tb;

reg clk;
reg rst;

integer errors;

pipeline_top dut(

    .clk(clk),
    .rst(rst)

);

///////////////////////////////////////////////////////////
// CLOCK GENERATION
///////////////////////////////////////////////////////////

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

///////////////////////////////////////////////////////////
// RESET
///////////////////////////////////////////////////////////

initial begin

    rst = 1;
    errors = 0;

    #20;
    rst = 0;

end

///////////////////////////////////////////////////////////
// VCD DUMP
///////////////////////////////////////////////////////////

initial begin

    $dumpfile("pipeline_wave.vcd");
    $dumpvars(0, pipeline_top_tb);

end

///////////////////////////////////////////////////////////
// PIPELINE MONITOR
///////////////////////////////////////////////////////////

initial begin

    $display("======================================================================");
    $display("TIME |   PC   | IF/ID INST | ID/EX RD | EX/MEM RD | MEM/WB RD ");
    $display("======================================================================");

    $monitor("%4t | %h | %h | %d | %d | %d",

        $time,
        dut.pc,
        dut.if_id_instr,
        dut.id_ex_rd,
        dut.ex_mem_rd,
        dut.mem_wb_rd

    );

end

///////////////////////////////////////////////////////////
// REGISTER CHECK TASK
///////////////////////////////////////////////////////////

task check_reg;

input [4:0] reg_num;
input [31:0] expected;

begin

    if(dut.u_rf.regs[reg_num] == expected)

        $display("X%0d PASS : %0d",

            reg_num,
            dut.u_rf.regs[reg_num]

        );

    else begin

        $display("X%0d FAIL : GOT=%0d EXPECTED=%0d",

            reg_num,
            dut.u_rf.regs[reg_num],
            expected

        );

        errors = errors + 1;

    end

end

endtask

///////////////////////////////////////////////////////////
// SELF CHECKING
///////////////////////////////////////////////////////////

initial begin

    ///////////////////////////////////////////////////////
    // WAIT FOR PIPELINE EXECUTION
    ///////////////////////////////////////////////////////

    #500;

    $display("\n");
    $display("==================================================");
    $display("          SELF CHECKING RESULTS");
    $display("==================================================");

    ///////////////////////////////////////////////////////
// FORWARDING HAZARD TESTS
///////////////////////////////////////////////////////

check_reg(1, 5);
check_reg(2, 10);
check_reg(3, 20);
check_reg(4, 40);
check_reg(5, 80);
    ///////////////////////////////////////////////////////
    // FINAL RESULT
    ///////////////////////////////////////////////////////

    $display("==================================================");

    if(errors == 0)

        $display("ALL TESTS PASSED");

    else

        $display("TOTAL FAILURES = %0d", errors);

    $display("==================================================");

    #20;

    $finish;

end

endmodule
