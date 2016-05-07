`timescale 1ns / 1ps
`include "Extend.v"
////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:16:30 04/15/2016
// Design Name:   Extend
// Module Name:   E:/CUP/ExtendTest.v
// Project Name:  CUP
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Extend
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ExtendTest;

	// Inputs
	reg [15:0] ExtAddr;
	reg ExtSel;

	// Outputs
	wire [31:0] ExtOut;

	// Instantiate the Unit Under Test (UUT)
	Extend uut (
		.ExtAddr(ExtAddr), 
		.ExtSel(ExtSel), 
		.ExtOut(ExtOut)
	);

	initial begin
		// Initialize Inputs
		ExtAddr = 0;
		ExtSel = 0;

		// Wait 100 ns for global reset to finish
		#100;
      ExtAddr = 16'b1111111111100000;
		ExtSel = 0;
		#100;
		ExtAddr = 16'b1111111111100000;
		ExtSel = 1;
		#100 $stop;
		// Add stimulus here

	end
      
endmodule

