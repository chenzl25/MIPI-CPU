`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:04:44 05/07/2016 
// Design Name: 
// Module Name:    IMem 
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
	module IMem(
     IAddr,
     IDataOut,
     IDataIn,
     RW
    );
	input [31:0] IAddr,IDataIn;
	input RW;
	output [31:0] IDataOut;
	reg 	[7:0] 	ins_memory [70:0];
	reg [31:0] count;
	//assign IDataOut = (RW != 1)? {{ins_memory[IAddr+3]},{ins_memory[IAddr+2]},{ins_memory[IAddr+1]},{ins_memory[IAddr]}}: 0; // read
	assign IDataOut[7:0] = ins_memory[IAddr];
	assign IDataOut[15:8] = ins_memory[IAddr+1];
	assign IDataOut[23:16] = ins_memory[IAddr+2];
	assign IDataOut[31:24] = ins_memory[IAddr+3];	
	initial begin
		count = 0;
		// j 11100000 00000000 00000000 00001000
		// jump to address 8
		ins_memory[0] = 8'b00000010;
		ins_memory[1] = 8'b00000000;
		ins_memory[2] = 8'b00000000;
		ins_memory[3] = 8'b11100000;

		// halt, but we expect it will be ignore
		ins_memory[4] = 8'b00000010;
		ins_memory[5] = 8'b00000000;
		ins_memory[6] = 8'b00000010;
		ins_memory[7] = 8'b11111111;
		//addi 000010 00000 00001 0000000000000001
		//r1 = 1;
		//ins_[0] <= 32'b00001000 00000001 00000000 00000001;
		ins_memory[8] = 8'b00000001;
		ins_memory[9] = 8'b00000000;
		ins_memory[10] = 8'b00000001;
		ins_memory[11] = 8'b00001000;
		// halt
		ins_memory[12] = 8'b00000000;
		ins_memory[13] = 8'b00100000;
		ins_memory[14] = 8'b01100010;
		ins_memory[15] = 8'b11111111;
	end
	
	always@(RW or IAddr) begin
		count = count + 1;
		if ((IAddr != 0) && (RW == 1) && (IDataIn != 0)) begin// write
			ins_memory[IAddr] <= IDataIn[7:0];
			ins_memory[IAddr+1] <= IDataIn[15:8];
			ins_memory[IAddr+2] <= IDataIn[23:16];
			ins_memory[IAddr+3] <= IDataIn[31:24];
		end
	end
endmodule

