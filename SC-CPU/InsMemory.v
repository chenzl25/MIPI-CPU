`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:39:21 04/15/2016 
// Design Name: 
// Module Name:    InsMemory 
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
module InsMemory(
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
		ins_memory[0] = 8'b00000000;
		ins_memory[1] = 8'b00000000;
		ins_memory[2] = 8'b00000000;
		ins_memory[3] = 8'b00000000;
		ins_memory[4] = 8'b00000000;
		ins_memory[5] = 8'b00000000;
		ins_memory[6] = 8'b00000000;
		ins_memory[7] = 8'b00000000;
		ins_memory[8] = 8'b00000000;
		ins_memory[9] = 8'b00000000;
		ins_memory[10] = 8'b00000000;
		ins_memory[11] = 8'b00000000;
		ins_memory[12] = 8'b00000000;
		ins_memory[13] = 8'b00000000;
		ins_memory[14] = 8'b00000000;
		ins_memory[15] = 8'b00000000;
		ins_memory[16] = 8'b00000000;
		ins_memory[17] = 8'b00000000;
		ins_memory[18] = 8'b00000000;
		ins_memory[19] = 8'b00000000;
		ins_memory[20] = 8'b00000000;
		ins_memory[21] = 8'b00000000;
		ins_memory[22] = 8'b00000000;
		ins_memory[23] = 8'b00000000;
		ins_memory[24] = 8'b00000000;
		ins_memory[25] = 8'b00000000;
		ins_memory[26] = 8'b00000000;
		ins_memory[27] = 8'b00000000;
		ins_memory[28] = 8'b00000000;
		ins_memory[29] = 8'b00000000;
		ins_memory[30] = 8'b00000000;
		ins_memory[31] = 8'b00000000;
		ins_memory[32] = 8'b00000000;
		ins_memory[33] = 8'b00000000;
		ins_memory[34] = 8'b00000000;
		ins_memory[35] = 8'b00000000;
		ins_memory[36] = 8'b00000000;
		ins_memory[37] = 8'b00000000;
		ins_memory[38] = 8'b00000000;
		ins_memory[39] = 8'b00000000;
		ins_memory[40] = 8'b00000000;
		ins_memory[41] = 8'b00000000;
		ins_memory[42] = 8'b00000000;
		ins_memory[43] = 8'b00000000;
		ins_memory[44] = 8'b00000000;
		ins_memory[45] = 8'b00000000;
		ins_memory[46] = 8'b00000000;
		ins_memory[47] = 8'b00000000;
		ins_memory[48] = 8'b00000000;
		ins_memory[49] = 8'b00000000;
		ins_memory[50] = 8'b00000000;
		ins_memory[51] = 8'b00000000;
		ins_memory[52] = 8'b00000000;
		ins_memory[53] = 8'b00000000;
		ins_memory[54] = 8'b00000000;
		ins_memory[55] = 8'b00000000;
		ins_memory[56] = 8'b00000000;
		ins_memory[57] = 8'b00000000;
		ins_memory[58] = 8'b00000000;
		ins_memory[59] = 8'b00000000;
		ins_memory[60] = 8'b00000000;
		ins_memory[61] = 8'b00000000;
		ins_memory[62] = 8'b00000000;
		ins_memory[63] = 8'b00000000;
		ins_memory[64] = 8'b00000000;
		ins_memory[65] = 8'b00000000;
		ins_memory[66] = 8'b00000000;
		ins_memory[67] = 8'b00000000;
		ins_memory[68] = 8'b00000000;
		ins_memory[69] = 8'b00000000;
		ins_memory[70] = 8'b00000000;
		//addi 000001 00000 00001 0000000000000001
		//r1 = 1;
		//ins_[0] <= 32'b00000100 00000001 00000000 00000001;
		ins_memory[0] = 8'b00000001;
		ins_memory[1] = 8'b00000000;
		ins_memory[2] = 8'b00000001;
		ins_memory[3] = 8'b00000100;
		
		//addi 000001 00000 00010 0000000000000010
		//r2 = 2;
		//ins_[1] <= 32'b00000100 00000010 00000000 00000010;
		ins_memory[4] = 8'b00000010;
		ins_memory[5] = 8'b00000000;
		ins_memory[6] = 8'b00000010;
		ins_memory[7] = 8'b00000100;
		//sub 000010 00001 00010 00011 00000000000
		//sub r3=r1-r2;  -1 = 1 - 2; 
		//ins_[2] <= 32'b00001000 00100010 00011000 00000000;
		ins_memory[8] = 8'b00000000;
		ins_memory[9] = 8'b00011000;
		ins_memory[10] = 8'b00100010;
		ins_memory[11] = 8'b00001000;
		// add 000000 00011 00010 00100 00000000000
		// ins_[3] = 00000000 01100010 00100000 00000000
		// add r4 = r3 + r2  1 = -1 + 2
		ins_memory[12] = 8'b00000000;
		ins_memory[13] = 8'b00100000;
		ins_memory[14] = 8'b01100010;
		ins_memory[15] = 8'b00000000;
		// ori 010000 00100 00101 1111100000000000
		// r5 = r4 | 1111100000000000  //r4 = 1,  r5 = 1111..1100..000001
		// ins_[4] = 32'b01000000 10000101  11111000 00000000
		ins_memory[16] = 8'b00000000;
		ins_memory[17] = 8'b11111000;
		ins_memory[18] = 8'b10000101;
		ins_memory[19] = 8'b01000000;
		// and 010001 00101 00100 00110 00000000000
		// and r6 = r5 & r4     //r6 = 1
		// ins_[5] = 32'b01000100 10100100 00110000 00000000
		ins_memory[20] = 8'b00000000;
		ins_memory[21] = 8'b00110000;
		ins_memory[22] = 8'b10100100;
		ins_memory[23] = 8'b01000100;
		// or 010010 00101 00010 00111 00000000000
		// or r7 = r5 | r2     //r5=1111..1100..000001, r2=2, r7 = 1111..10..011
		// ins_[6] = 32'b01001000 10100010 00111000 00000000
		ins_memory[24] = 8'b00000000;
		ins_memory[25] = 8'b00111000;
		ins_memory[26] = 8'b10100010;
		ins_memory[27] = 8'b01001000;
		// move 100000 00111 00000 01000 00000000000
		// and r8 = r7
		// ins_[7] = 32'b10000000 11100000 01000000 00000000
		ins_memory[28] = 8'b00000000;
		ins_memory[29] = 8'b01000000;
		ins_memory[30] = 8'b11100000;
		ins_memory[31] = 8'b10000000;
		//sw 100110 00000 01000 0000000000000100
		// mem[4] = r8 //r8 = 1111..11000..0011
		// ins_[8]= 32'b10011000 00001000 00000000 00000100
		ins_memory[32] = 8'b00000100;
		ins_memory[33] = 8'b00000000;
		ins_memory[34] = 8'b00001000;
		ins_memory[35] = 8'b10011000;
		//lw 100111 00000 01001 0000000000000100
		// r9 = mem[4] //mem[4] = 1111..11000..0011
		// ins_[9]= 32'b10011100 00001001 00000000 00000100
		ins_memory[36] = 8'b00000100;
		ins_memory[37] = 8'b00000000;
		ins_memory[38] = 8'b00001001;
		ins_memory[39] = 8'b10011100;
		//beq 110000 01000 01001 00000000 00000001
		// if r8 == r9 then goto next next instruction
		// ins_[10]= 32'b11000001 00001001 00000000 00000001
		ins_memory[40] = 8'b00000001;
		ins_memory[41] = 8'b00000000;
		ins_memory[42] = 8'b00001001;
		ins_memory[43] = 8'b11000001;
		
		//lw 100111 00000 01010 0000000000000100
		// r10 = mem[4] //mem[4] = 1111..11000..0011
		// ins_[11]= 32'b10011100 00001010 00000000 00000100
		ins_memory[44] = 8'b00000100;
		ins_memory[45] = 8'b00000000;
		ins_memory[46] = 8'b00001010;
		ins_memory[47] = 8'b10011100;
		
		//lw 100111 00000 01011 0000000000000100
		// r11 = mem[4] //mem[4] = 1111..11000..0011
		// ins_[12]= 32'b10011100 00001011 00000000 00000100
		ins_memory[48] = 8'b00000100;
		ins_memory[49] = 8'b00000000;
		ins_memory[50] = 8'b00001011;
		ins_memory[51] = 8'b10011100;
		
		//beq 110000 00000 01001 11111111 11111110
		// if r0 == r9 then goto next next instruction
		// ins_[10]= 32'b11000000 00001001 11111111 11111110
		ins_memory[52] = 8'b11111110;
		ins_memory[53] = 8'b11111111;
		ins_memory[54] = 8'b00001001;
		ins_memory[55] = 8'b11000000;
		
		//halt 11111100 00000000 00000000 00000000
		ins_memory[56] = 8'b00000000;
		ins_memory[57] = 8'b00000000;
		ins_memory[58] = 8'b00000000;
		ins_memory[59] = 8'b11111100;
		//halt 11111100 00000000 00000000 00000000
		ins_memory[60] = 8'b00000000;
		ins_memory[61] = 8'b00000000;
		ins_memory[62] = 8'b00000000;
		ins_memory[63] = 8'b11111100;
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
