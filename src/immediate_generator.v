`timescale 1ns/1ps

module immediate_generator(

input  [31:0] instruction,
output reg [31:0] imm_out

);

reg [11:0] imm_temp_i;
reg [19:0] imm_temp_u;
reg [20:0] imm_temp_j;
reg [11:0] imm_temp_s;
reg [12:0] imm_temp_b;

wire [6:0] opcode;

assign opcode = instruction[6:0];

always @(*) begin
    imm_temp_i = 0;
    imm_temp_b = 0;
    imm_temp_j = 0;
    imm_temp_s = 0;
    imm_temp_u = 0;
    case(opcode)

    7'b1100111,
    7'b0000011,
    7'b0010011: begin

        imm_temp_i = instruction[31:20];
        imm_out  = {{20{imm_temp_i[11]}}, imm_temp_i};

    end

    7'b0110111,
    7'b0010111: begin

        imm_temp_u = instruction[31:12];
        imm_out    = {imm_temp_u, 12'b0};

    end

    7'b1101111: begin

        imm_temp_j = {
                        instruction[31],      // imm[20]
                        instruction[19:12],   // imm[19:12]
                        instruction[20],      // imm[11]
                        instruction[30:21],   // imm[10:1]
                        1'b0                  // imm[0]
                     };

        imm_out = {{11{imm_temp_j[20]}}, imm_temp_j};

    end

    7'b1100011: begin

        imm_temp_b = {
                        instruction[31],      // imm[12]
                        instruction[7],       // imm[11]
                        instruction[30:25],   // imm[10:5]
                        instruction[11:8],    // imm[4:1]
                        1'b0                  // imm[0]
                     };

        imm_out = {{19{imm_temp_b[12]}}, imm_temp_b};

    end

    7'b0100011: begin

        imm_temp_s = {
                        instruction[31:25],   // imm[11:5]
                        instruction[11:7]     // imm[4:0]
                     };

        imm_out = {{20{imm_temp_s[11]}}, imm_temp_s};

    end

    default: begin

        imm_out = 32'h00000000;

    end

    endcase

end

endmodule
