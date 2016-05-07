`timescale 1ns / 1ps
`include "RegFile.v"
////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:26:19 04/16/2016
// Design Name:   RegFile
// Module Name:   E:/CUP/RegFileTest.v
// Project Name:  CUP
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RegFile
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module RegFileTest;

	// Inputs
	reg [4:0] rna;
	reg [4:0] rnb;
	reg [31:0] d;
	reg [4:0] wn;
	reg we;
	reg clk;
	reg clrn;

	// Outputs
	wire [31:0] qa;
	wire [31:0] qb;

	// Instantiate the Unit Under Test (UUT)
	RegFile uut (
		.rna(rna), 
		.rnb(rnb), 
		.d(d), 
		.wn(wn), 
		.we(we), 
		.clk(clk), 
		.clrn(clrn), 
		.qa(qa), 
		.qb(qb)
	);

	initial begin
		// Initialize Inputs
		rna = 0;
		rnb = 0;
		d = 0;
		wn = 0;
		we = 0;
		clk = 0;
		clrn = 1;

		// Wait 100 ns for global reset to finish
		#100;
      
		// Add stimulus here
		
		#50;
		wn = 1;
		d = 8+4+2+1;
		we = 1;
		#100;
		
		rna = 0;
		rnb = 1;
		#100;
		clrn = 0;
		#100;
		rna = 0;
		rnb = 1;
		#100 $stop;
	end
   always begin  
    clk = 1;  
    #50;  
    clk = 0;  
    #50;  
	end  
endmodule

