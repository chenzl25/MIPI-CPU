`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:30:15 05/06/2016 
// Design Name: 
// Module Name:    AluCache 
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
module AluCache(
    clk,
    alu_cache_data_in,
    alu_cache_data_out
    );
	 input clk;
	 input [31:0] alu_cache_data_in;
	 output reg [31:0] alu_cache_data_out;
	 reg [31:0] next_alu_cache;
	 
	 always @(negedge clk) begin
		next_alu_cache = alu_cache_data_in;
	 end
	 always @(posedge clk) begin 
		alu_cache_data_out = next_alu_cache;
	 end

endmodule
