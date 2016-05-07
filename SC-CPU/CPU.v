`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:51:05 04/15/2016 
// Design Name: 
// Module Name:    CPU 
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
`include "ControlUnit.v"
`include "Memory.v"
`include "PC.v"
`include "RegFile.v"
`include "InsMemory.v"
`include "Extend.v"
`include "ALU.v"
`include "AluCache.v"
`include "MemCache.v"
`include "InsCache.v"
`include "Reg1Cache.v"
`include "Reg2Cache.v"
module CPU(
    input clk,
	 input clrn,
	 input Reset,
	 input setPc,
	 output [31:0] pc_from_PC,
	 output [31:0] instruction,
	 output [31:0] rs_data,
	 output [31:0] rt_data,
	 output [31:0] branch_offset,
	 output [2:0] ALUOp,
	 output [31:0] _ALU_a,
	 output [31:0] _ALU_b,
	 output [31:0] _ALU_result
    );
	 //wire [31:0] pc;
	 wire [31:0] pc_to_InsMemory;
	 //wire [31:0] pc_from_PC;
	 reg [31:0] initPc;
	 wire PCWre, PCSrc;
//	 wire [31:0] branch_offset;
	 wire [4:0] rs;
	 wire [4:0] rt;
	 wire [4:0] rd;
	 wire [5:0] decode;
	 wire [15:0] immd;
//	 wire [31:0] instruction, rs_data, rt_data;
	 wire ALUSrcB, ALUM2Reg, RegWre, InsMemRW, DataMemRW, ExtSel, RegOut, zero;
//	 wire [2:0]ALUOp;
	 wire [31:0] IDataIn;
	 wire [15:0] ExtAddr;
	 wire [31:0] ExtOut;
	 wire [31:0] data_write_to_register;
	 wire [4:0] address_write_to_register;
	 wire [31:0]DAddr,DataOut, DataIn;
//	 wire [31:0] _ALU_a, _ALU_b, _ALU_result;

	 wire [31:0] alu_cache_data_in,alu_cache_data_out,mem_cache_data_in,mem_cache_data_out,
					 ins_cache_data_in,ins_cache_data_out,reg1_cache_data_in,reg1_cache_data_out,
					 reg2_cache_data_in,reg2_cache_data_out;

	 initial begin
		//pc = 32'h00000000;
		initPc = 32'h00000000;
	 end
	
	 assign PCWre = 1;
	 assign branch_offset = ExtOut;
	 PC _PC(
     .clk(clk),
     .Reset(Reset),
     .PCWre(PCWre),
     .pc(pc_from_PC),
	  .PCSrc(PCSrc),
	  .branch_offset(branch_offset),
	  .initPc(initPc),
	  .setPc(setPc)
    );
	 // dummy 0
	 assign IDataIn = 0;
	 assign pc_to_InsMemory = pc_from_PC;
	 InsMemory _InsMemory(
     .IAddr(pc_to_InsMemory),
     .IDataOut(instruction),
     .IDataIn(IDataIn),
     .RW(InsMemRW)
    );
	 
	 assign decode = instruction[31:26];
	 ControlUnit _ControlUnit(
     .decode(decode),
     .zero(zero),
     .RegWre(RegWre),
     .PCWre(PCWre),
     .ALUSrcB(ALUSrcB),
     .ALUOp(ALUOp),
     .ALUM2Reg(ALUM2Reg),
     .RegOut(RegOut),
     .DataMemRw(DataMemRW),
     .PCSrc(PCSrc),
     .ExtSel(ExtSel),
	  .InsMemRW(InsMemRW)
    );
	 
	 assign ExtAddr = instruction[15:0];
	 Extend _Extend(
     .ExtAddr(ExtAddr),
     .ExtSel(ExtSel),
     .ExtOut(ExtOut)
    );
	 
	 assign rs = instruction[25:21];
	 assign rt = instruction[20:16];
	 assign rd = instruction[15:11];
	 assign address_write_to_register = RegOut == 0? rt: rd;
	 assign data_write_to_register = ALUM2Reg == 0? _ALU_result: DataOut;
	 RegFile _RegFile(
		.rna(rs),
		.rnb(rt),
		.d(data_write_to_register),
		.wn(address_write_to_register),
		.we(RegWre),
		.clk(clk),
		.clrn(clrn),
		.qa(rs_data),
		.qb(rt_data)
	 );
	 
	 assign DAddr = _ALU_result;
	 assign DataIn = rt_data;
	 Data_Memory _Data_Memory(
     .RW(DataMemRW),
     .DAddr(DAddr),
     .DataOut(DataOut),
     .DataIn(DataIn),
	  .clk(clk)
    );
	 
	 assign _ALU_a = rs_data;
	 assign _ALU_b = ALUSrcB == 0? rt_data: ExtOut;
	 ALU _ALU(
     .a(_ALU_a),
     .b(_ALU_b),
     .s(ALUOp),
     .result(_ALU_result),
     .zero(zero)
    );
	 
	 AluCache _AluCache(
		.clk(clk),
		.alu_cache_data_in(alu_cache_data_in),
		.alu_cache_data_out(alu_cache_data_out)
	 );
	 MemCache _MemCache(
		.clk(clk),
		.mem_cache_data_in(mem_cache_data_in),
		.mem_cache_data_out(mem_cache_data_out)
	 );
	 InsCache _InsCache(
		.clk(clk),
		.ins_cache_data_in(ins_cache_data_in),
		.ins_cache_data_out(ins_cache_data_out)
	 );
	 Reg1Cache _Reg1Cache(
		.clk(clk),
		.reg1_cache_data_in(reg1_cache_data_in),
		.reg1_cache_data_out(reg1_cache_data_out)
	 );
	 Reg2Cache _Reg2Cache(
		.clk(clk),
		.reg2_cache_data_in(reg2_cache_data_in),
		.reg2_cache_data_out(reg2_cache_data_out)
	 );
	 
endmodule
