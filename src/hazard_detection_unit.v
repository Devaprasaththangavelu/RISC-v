`timescale 1ns/1ps

module hazard_detection_unit(

    input        id_ex_mem_read,
    input  [4:0] id_ex_rd,

    input  [4:0] rs1,
    input  [4:0] rs2,

    output reg pc_write,
    output reg if_id_write,
    output reg control_sel

);

always @(*) begin

    ///////////////////////////////////////////////////////
    // DEFAULT VALUES
    ///////////////////////////////////////////////////////

    pc_write   = 1'b1;
    if_id_write = 1'b1;
    control_sel = 1'b0;

    ///////////////////////////////////////////////////////
    // LOAD USE HAZARD DETECTION
    ///////////////////////////////////////////////////////

    if(id_ex_mem_read &&
      ((id_ex_rd == rs1) || (id_ex_rd == rs2)) &&
       (id_ex_rd != 5'b00000))

    begin

        ///////////////////////////////////////////////////
        // STALL PIPELINE
        ///////////////////////////////////////////////////

        pc_write    = 1'b0;
        if_id_write = 1'b0;

        ///////////////////////////////////////////////////
        // INSERT BUBBLE
        ///////////////////////////////////////////////////

        control_sel = 1'b1;

    end

end

endmodule
