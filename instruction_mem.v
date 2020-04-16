`timescale 1 ns / 1 ns
`include "constant_values.h"

module instruction_mem(address, instruction);
    input [31:0] address;
    output reg [31:0] instruction;
    reg [31:0] mem[0: 2** 16 - 1];
    
    always @(address) begin
        instruction = mem[address];
    end
endmodule