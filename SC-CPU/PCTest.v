`timescale 1ns / 1ps
`include "PC.v"
////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:44:03 04/16/2016
// Design Name:   PC
// Module Name:   E:/CUP/PCTest.v
// Project Name:  CUP
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PC
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PCTest;

	// Inputs
	reg clk;
	reg Reset;
	reg PCWre;
	reg PCSrc;
	reg [31:0] branch_offset;
	reg [31:0] initPc;

	// Outputs
	wire [31:0] pc;

	// Instantiate the Unit Under Test (UUT)
	PC uut (
		.clk(clk), 
		.Reset(Reset), 
		.PCWre(PCWre), 
		.pc(pc), 
		.PCSrc(PCSrc), 
		.branch_offset(branch_offset), 
		.initPc(initPc)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		Reset = 0;
		PCWre = 1;
		
		//branch_offset = 8*8*8*8;
		PCSrc = 1;
		initPc = 7;

		// Wait 100 ns for global reset to finish
		#100;
      #100 $stop;
		// Add stimulus here

	end
   always begin  
    clk = 1;  
    #10;  
    clk = 0;  
    #10;  
	end 
endmodule

