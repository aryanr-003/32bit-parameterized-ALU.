`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.02.2026 18:42:26
// Design Name: 
// Module Name: alu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu #(
    parameter WIDTH = 32   
)(
    input  [WIDTH-1:0] a,
    input  [WIDTH-1:0] b,
    input  [3:0] op,
    output reg [WIDTH-1:0] result,
    output reg carry,
    output reg zero,
    output reg overflow,
    output reg less_than
);  
    wire [WIDTH:0] add_ext;
    wire [WIDTH:0] sub_ext;
    assign add_ext = {1'b0, a} + {1'b0, b};
    assign sub_ext = {1'b0, a} - {1'b0, b};
    always @(*) begin       
        result     = {WIDTH{1'b0}};
        carry      = 1'b0;
        overflow   = 1'b0;
        less_than  = 1'b0;
        case(op)          
            4'b0000: begin
                result   = add_ext[WIDTH-1:0];
                carry    = add_ext[WIDTH];
                overflow = (~(a[WIDTH-1] ^ b[WIDTH-1])) &
                           (result[WIDTH-1] ^ a[WIDTH-1]);
            end            
            4'b0001: begin
                result   = sub_ext[WIDTH-1:0];
                carry    = sub_ext[WIDTH];
                overflow = ((a[WIDTH-1] ^ b[WIDTH-1])) &
                           (result[WIDTH-1] ^ a[WIDTH-1]);
                less_than = (a < b);  
            end            
            4'b0010: result = a & b;            
            4'b0011: result = a | b;            
            4'b0100: result = a ^ b;
            4'b0101: result = a << 1;
            4'b0110: result = a >> 1;
            4'b0111: begin
                less_than = ($signed(a) < $signed(b));
                result    = {{(WIDTH-1){1'b0}}, less_than};
            end
            default: result = {WIDTH{1'b0}};
        endcase
        zero = (result == {WIDTH{1'b0}});
    end
endmodule
