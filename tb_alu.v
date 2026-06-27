`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.02.2026 18:51:28
// Design Name: 
// Module Name: tb_alu
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

module tb_alu;
parameter WIDTH = 32;
reg  [WIDTH-1:0] a, b;
reg  [3:0] op;
wire [WIDTH-1:0] result;
wire carry, zero, overflow, less_than;
alu #(.WIDTH(WIDTH)) dut (.a(a),.b(b),.op(op),.result(result),.carry(carry),.zero(zero),.overflow(overflow),.less_than(less_than));
initial begin
    a = 10; b = 5; op = 4'b0000; #10;
    if(result != 15) $display("ADD ERROR");    
    a = 10; b = 3; op = 4'b0001; #10;
    if(result != 7) $display("SUB ERROR");    
    a = 8'hF0; b = 8'h0F; op = 4'b0010; #10;
    if(result != 0) $display("AND ERROR");  
    op = 4'b0011; #10;
    if(result != 8'hFF) $display("OR ERROR");   
    op = 4'b0100; #10;
    if(result != 8'hFF) $display("XOR ERROR");   
    a = 4; op = 4'b0101; #10;
    if(result != 8) $display("SHL ERROR");  
    a = 8; op = 4'b0110; #10;
    if(result != 4) $display("SHR ERROR");
    a = -5; b = 3; op = 4'b0111; #10;
    if(less_than != 1) $display("SLT ERROR");
    $display("Simulation Finished");
    $finish;
    
end
endmodule