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
// CLOCK
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
// VCD
///////////////////////////////////////////////////////////

initial begin

    $dumpfile("pipeline_wave.vcd");
    $dumpvars(0, pipeline_top_tb);

end

///////////////////////////////////////////////////////////
// PIPELINE MONITOR
///////////////////////////////////////////////////////////

initial begin

    $display("======================================================================================");
    $display("TIME |   PC   | IF/ID INST | ID/EX RD | EX/MEM RD | MEM/WB RD ");
    $display("======================================================================================");

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
// CHECK TASK
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
// MAIN CHECK
///////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////
// SELF CHECKING
///////////////////////////////////////////////////////////

initial begin

    ///////////////////////////////////////////////////////
    // WAIT FOR EXECUTION
    ///////////////////////////////////////////////////////

    #100;

    $display("\n");
    $display("==================================================");
    $display("       FORWARDING DEBUG TEST RESULTS");
    $display("==================================================");

    ///////////////////////////////////////////////////////
    // CHECK RESULTS
    ///////////////////////////////////////////////////////

    check_reg(1, 5);
    check_reg(2, 10);
    check_reg(3, 15);
    check_reg(4, 20);
    check_reg(6, 35);

    ///////////////////////////////////////////////////////
    // FINAL RESULT
    ///////////////////////////////////////////////////////

    $display("==================================================");

    if(errors == 0)

        $display("FORWARDING VERIFIED SUCCESSFULLY");

    else

        $display("TOTAL FAILURES = %0d", errors);

    $display("==================================================");

    #20;

    $finish;

end
///////////////////////////////////////////////////////////
// DEBUG MONITOR
///////////////////////////////////////////////////////////

always @(posedge clk) begin

    $display("\n------------------------------------------------");

    $display("TIME=%0t", $time);

    $display("PC=%h", dut.pc);

    $display("IF_ID_INSTR=%h", dut.if_id_instr);

    $display("ID_EX_RD=%0d", dut.id_ex_rd);

    $display("ID_EX_RS1=%0d", dut.id_ex_rs1);
    $display("ID_EX_RS2=%0d", dut.id_ex_rs2);

    $display("ID_EX_RS1_DATA=%0d", dut.id_ex_rs1_data);
    $display("ID_EX_RS2_DATA=%0d", dut.id_ex_rs2_data);

    $display("FORWARD_A=%b", dut.forward_a);
    $display("FORWARD_B=%b", dut.forward_b);

    $display("FORWARDED_RS1=%0d", dut.forwarded_rs1);
    $display("FORWARDED_RS2=%0d", dut.forwarded_rs2);

    $display("ALU_RESULT=%0d", dut.alu_result);

    $display("EX_MEM_RD=%0d", dut.ex_mem_rd);
    $display("MEM_WB_RD=%0d", dut.mem_wb_rd);

end



endmodule
