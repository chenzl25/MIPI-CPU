`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:23:35 04/15/2016 
// Design Name: 
// Module Name:    ControlUnit 
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
module ControlUnit(
     decode,
     zero,
     RegWre,
     PCWre,
     ALUSrcB,
     ALUOp,
     ALUM2Reg,
     RegOut,
     DataMemRw,
     PCSrc,
     ExtSel,
	  InsMemRW,
	  clk.
	  reset
    );
		input clk;
		input reset;
		input [5:0] decode;
		input zero;
		output reg RegWre,PCWre,ALUSrcB,ALUM2Reg,RegOut,DataMemRw,PCSrc,ExtSel, InsMemRW;
		output reg [2:0] ALUOp;
		reg [31:0] count;
		initial begin
			count = 0;
		end
		 //若decode(指令操作码)有变化，都会触发以下部分产生新的控制信号
		 always@( decode) begin
			 count = count + 1;
			 case( decode) 
				// add, R-format
				6'b000000:
				begin   //以下都是控制单元产生的控制信号
					RegWre = 1;
					PCWre = 1;
					ALUSrcB = 0;
					ALUOp = 000;
					ALUM2Reg = 0;
					RegWre = 1;
					DataMemRw = 0;
					PCSrc = 0;
					ExtSel = 0;
					InsMemRW = 0;
					RegOut = 1;
				end
				//addi I-format
				6'b000001:
				begin
					RegWre = 1;
					PCWre = 1;
					ALUSrcB = 1;
					ALUOp = 000;
					ALUM2Reg = 0;
					RegWre = 1;
					DataMemRw = 0;
					PCSrc = 0;
					ExtSel = 1;
					InsMemRW = 0;
					RegOut = 0;
				end
				// sub, R-format
				6'b000010:
				begin
					RegWre = 1;
					PCWre = 1;
					ALUSrcB = 0;
					ALUOp = 001;
					ALUM2Reg = 0;
					RegWre = 1;
					DataMemRw = 0;
					PCSrc = 0;
					ExtSel = 0;
					InsMemRW = 0;
					RegOut = 1;
				end
				// ori I-format
				6'b010000:
				begin
					RegWre = 1;
					PCWre = 1;
					ALUSrcB = 1;
					ALUOp = 011;
					ALUM2Reg = 0;
					RegWre = 1;
					DataMemRw = 0;
					PCSrc = 0;
					ExtSel = 1;
					InsMemRW = 0;
					RegOut = 0;
				end
				// and, R-format
				6'b010001:
				begin   //以下都是控制单元产生的控制信号
					RegWre = 1;
					PCWre = 1;
					ALUSrcB = 0;
					ALUOp = 100;
					ALUM2Reg = 0;
					RegWre = 1;
					DataMemRw = 0;
					PCSrc = 0;
					ExtSel = 0;
					InsMemRW = 0;
					RegOut = 1;
				end
				// or, R-format
				6'b010010:
				begin   //以下都是控制单元产生的控制信号
					RegWre = 1;
					PCWre = 1;
					ALUSrcB = 0;
					ALUOp = 011;
					ALUM2Reg = 0;
					RegWre = 1;
					DataMemRw = 0;
					PCSrc = 0;
					ExtSel = 0;
					InsMemRW = 0;
					RegOut = 1;
				end
				// move, R-format
				6'b100000:
				begin   //以下都是控制单元产生的控制信号
					RegWre = 1;
					PCWre = 1;
					ALUSrcB = 0;
					ALUOp = 000;
					ALUM2Reg = 0;
					RegWre = 1;
					DataMemRw = 0;
					PCSrc = 0;
					ExtSel = 0;
					InsMemRW = 0;
					RegOut = 1;
				end
				// sw I-format
				6'b100110:
				begin
					RegWre = 0;
					PCWre = 1;
					ALUSrcB = 1;
					ALUOp = 000;
					ALUM2Reg = 1;
					RegWre = 0;
					DataMemRw = 1;
					PCSrc = 0;
					ExtSel = 1;
					InsMemRW = 0;
					RegOut = 0;
				end
				// lw I-format
				6'b100111:
				begin
					RegWre = 1;
					PCWre = 1;
					ALUSrcB = 1;
					ALUOp = 000;
					ALUM2Reg = 1;
					RegWre = 1;
					DataMemRw = 0;
					PCSrc = 0;
					ExtSel = 1;
					InsMemRW = 0;
					RegOut = 0;
				end
				// beq I-format
				6'b110000:
				begin
					RegWre = 0;
					PCWre = 1;
					ALUSrcB = 0;
					ALUOp = 001;
					ALUM2Reg = 1;
					RegWre = 0;
					DataMemRw = 0;
					assign PCSrc = zero;
					ExtSel = 1;
					InsMemRW = 0;
					RegOut = 0;
				end
				// halt
				6'b111111:
				begin
					RegWre = 0;
					PCWre = 0;
					ALUSrcB = 0;
					ALUOp = 000;
					ALUM2Reg = 0;
					RegWre = 0;
					DataMemRw = 0;
					PCSrc = 0;
					ExtSel = 0;
					InsMemRW = 0;
					RegOut = 0;
				end
				endcase
		 end
endmodule