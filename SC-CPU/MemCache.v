`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:28:09 05/06/2016 
// Design Name: 
// Module Name:    MemCache 
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
module MemCache(
    input clk,
    input [31:0] mem_cache_data_in,
    mem_cache_data_out
    );
	output reg [31:0] mem_cache_data_out;
	 reg [31:0] next_alu_cache;
	 
	 always @(negedge clk) begin
		next_alu_cache = mem_cache_data_in;
	 end
	 always @(posedge clk) begin 
		mem_cache_data_out = next_alu_cache;
	 end

endmodule
