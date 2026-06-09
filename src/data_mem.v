
`timescale 1ns/1ps
module data_mem (
    input             clk,
    input             we, 
    input             re,        
    input      [31:0] addr,
    input      [31:0] write_data,
    output     [31:0] read_data    // wire not reg
);
    reg [31:0] mem [0:255];
    
    always @(posedge clk) begin
        if (we)
            mem[addr[9:2]] <= write_data;
    end
    
    assign read_data = mem[addr[9:2]];  // async read

endmodule
