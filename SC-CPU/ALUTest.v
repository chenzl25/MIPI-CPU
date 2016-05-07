`timescale 1ns / 1ps
`include "ALU.v"
////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:29:02 04/15/2016
// Design Name:   ALU
// Module Name:   E:/CUP/ALUTest.v
// Project Name:  CUP
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALUTest;

	// Inputs
	reg [31:0] a;
	reg [31:0] b;
	reg [2:0] s;

	// Outputs
	wire [31:0] result;
	wire zero;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.a(a), 
		.b(b), 
		.s(s), 
		.result(result), 
		.zero(zero)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		s = 0;

		// Wait 100 ns for global reset to finish
		#100;
      a = 4;
		b = 2;
		s = 3'b000;
		#100
		s = 3'b001;
		#100
		s = 3'b010;
		#100
		s = 3'b000;
		// Add stimulus here
		#100 $stop;
	end
      
endmodule

