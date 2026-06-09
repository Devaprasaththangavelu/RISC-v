`timescale 1ns/1ps

module forwarding_mux(

input  [31:0] rs,
input  [31:0] ex_out,
input  [31:0] wb_out,
input  [1:0]  sel,

output reg [31:0] operand

);

always @(*) begin

    case(sel)

        2'b00:operand = rs;
        2'b10:operand = ex_out;
        2'b01:operand = wb_out; 
        default:operand = rs;
            

    endcase

end

endmodule
