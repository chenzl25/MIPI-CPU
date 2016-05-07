`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:24:29 04/15/2016
// Design Name:   CPU
// Module Name:   E:/CUP/CPUTest.v
// Project Name:  CUP
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CPU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CPUTest;

	// Inputs
	reg clk;
	reg clrn;
	reg Reset;
	reg setPc;
	wire [31:0] pc_from_PC;
	wire [31:0] instruction;
	wire [31:0] rs_data;
	wire [31:0] rt_data;
	wire [31:0] branch_offset;
	wire [2:0] ALUOp;
	wire [31:0] _ALU_a;
	wire [31:0] _ALU_b;
	wire [31:0] _ALU_result;
	// Instantiate the Unit Under Test (UUT)
	CPU uut (
		.clk(clk), 
		.clrn(clrn), 
		.Reset(Reset),
		.setPc(setPc),
		.pc_from_PC(pc_from_PC),
		.instruction(instruction),
		.rs_data(rs_data),
		.rt_data(rt_data),
		.branch_offset(branch_offset),
		.ALUOp(ALUOp),
		._ALU_a(_ALU_a),
		._ALU_b(_ALU_b),
		._ALU_result(_ALU_result)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		clrn = 1;
		Reset = 0;
		setPc = 1;
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		#500 $stop;
	end
   always begin  
    clk = 1;  
    #5;  
    clk = 0;  
    #5;
	 if(setPc == 1) begin
		setPc = 0;
	 end
	end 
endmodule

