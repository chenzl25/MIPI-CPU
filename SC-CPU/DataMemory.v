`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:43:01 04/15/2016
// Design Name:   DataMemory
// Module Name:   E:/CUP/DataMemory.v
// Project Name:  CUP
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DataMemory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module DataMemory;

	// Inputs
	reg RW;
	reg [31:0] DAddr;
	reg [31:0] DataIn;

	// Outputs
	wire [31:0] DataOut;

	// Instantiate the Unit Under Test (UUT)
	DataMemory uut (
		.RW(RW), 
		.DAddr(DAddr), 
		.DataOut(DataOut), 
		.DataIn(DataIn)
	);

	initial begin
		// Initialize Inputs
		RW = 0;
		DAddr = 0;
		DataIn = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

