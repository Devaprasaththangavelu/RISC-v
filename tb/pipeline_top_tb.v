`timescale 1ns/1ps

module pipeline_top_tb;

reg clk;
reg rst;

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
// RESET SEQUENCE
///////////////////////////////////////////////////////////

initial begin

    rst = 1;

    #20;

    rst = 0;

end

///////////////////////////////////////////////////////////
// SIMULATION CONTROL
///////////////////////////////////////////////////////////

initial begin

    $dumpfile("pipeline_wave.vcd");
    $dumpvars(0, pipeline_top_tb);

    #300;

    $finish;

end

///////////////////////////////////////////////////////////
// PIPELINE MONITORING
///////////////////////////////////////////////////////////

initial begin

    $display("==============================================================");
    $display(" TIME |   PC   | IF/ID INST | ID/EX RD | EX/MEM RD | MEM/WB RD ");
    $display("==============================================================");

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
// ADDITIONAL DEBUG SIGNALS
///////////////////////////////////////////////////////////

initial begin

    $monitor(

        "TIME=%0t PC=%h INST=%h ALU_RESULT=%h WB_DATA=%h",

        $time,

        dut.pc,

        dut.if_id_instr,

        dut.alu_result,

        dut.wb_data

    );

end

endmodule
