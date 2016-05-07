`timescale 1ns / 1ps
`include "InsMemory.v"
////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:48:12 04/15/2016
// Design Name:   InsMemory
// Module Name:   E:/CUP/InsMemoryTest.v
// Project Name:  CUP
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: InsMemory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module InsMemoryTest;

	// Inputs
	reg [31:0] IAddr;
	reg [31:0] IDataIn;
	reg RW;

	// Outputs
	wire [31:0] IDataOut;

	// Instantiate the Unit Under Test (UUT)
	InsMemory uut (
		.IAddr(IAddr), 
		.IDataOut(IDataOut), 
		.IDataIn(IDataIn), 
		.RW(RW)
	);

	initial begin
		// Initialize Inputs
		IAddr = 0;
		IDataIn = 0;
		RW = 0;

		// Wait 100 ns for global reset to finish
		#100;
      IAddr = 4;
		RW = 0;
		#100;
		IAddr = 8;
		RW = 0;
		// Add stimulus here
		#100 $stop;
	end
      
endmodule

