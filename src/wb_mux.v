`timescale 1ns/1ps

module wb_mux (

    input  [31:0] alu_result,
    input  [31:0] mem_data,
    input          wb_sel,

    output reg [31:0] wb_data

);

always @(*) begin

    case (wb_sel)

        1'b0: wb_data = alu_result;  // R-type / I-type ALU
        1'b1: wb_data = mem_data;    // LW

        default: wb_data = 32'b0;

    endcase

end

endmodule
