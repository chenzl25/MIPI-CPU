`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:49:49 04/15/2016 
// Design Name: 
// Module Name:    PC 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module PC(
     clk,
     Reset,
     PCWre,
     pc,
	  PCSrc,
	  branch_offset,
	  initPc,
	  setPc
    );
	input clk, Reset, PCWre, PCSrc;
	input [31:0] branch_offset;
	input [31:0] initPc;
	input setPc;
	output [31:0] pc;
	reg    [31:0] pc;
	//wire [31:0] nextAddr;
	reg [31:0]nextPc; // interal data
	reg [31:0] count;
	wire [31:0] address_plus_beq;
	wire [31:0] address_plus_four;
	reg [31:0] tem;
	initial begin
		count = 0;
		pc = 0;
	end
	
	always@(setPc) begin
		pc = initPc;
	end
	
	assign address_plus_beq = address_plus_four + (branch_offset << 2);
	assign address_plus_four = pc + 4;
	//assign nextAddr = (PCSrc == 0) ? pc + 4: pc + 4 + (branch_offset << 2);
	
	always @(address_plus_beq or address_plus_four or PCSrc) begin
		if (PCSrc == 1'b0) begin
			nextPc = address_plus_four;
		end else begin
			tem = address_plus_beq;
			nextPc = tem;
		end
		
		//nextPc = (PCSrc == 0) ? address_plus_four: address_plus_beq;
	end
	
	// every clk we assian the nextPc to pc(output)
	always @(posedge clk) begin
		count = count +1;
		//nextPc = (PCSrc == 0) ? pc + 4: pc + 4 + (branch_offset << 2);
		if (PCWre == 1)
			pc <= nextPc;
	end
	
endmodule
