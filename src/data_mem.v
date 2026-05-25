`timescale 1ns/1ps
module data_mem (
    input              clk,
    input              we, 
    input              re,        
    input      [31:0] addr,
    input      [31:0] write_data,
    output reg [31:0] read_data
);

   
    reg [31:0] mem [0:255];

    
    always @(posedge clk) begin
        if (we)
            mem[addr[9:2]] <= write_data;
    end
       
       
    always @(posedge clk) begin  
        if(re)
             read_data <= mem[addr[9:2]];
    end
    
endmodule
