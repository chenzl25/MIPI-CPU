`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:31:26 05/06/2016 
// Design Name: 
// Module Name:    Reg1Cache 
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
module Reg1Cache(
    input clk,
    input [31:0] reg1_cache_data_in,
    reg2_cache_data_out
    );
	output reg [31:0] reg2_cache_data_out;
	 reg [31:0] next_alu_cache;
	 
	 always @(negedge clk) begin
		next_alu_cache = reg1_cache_data_in;
	 end
	 always @(posedge clk) begin 
		reg2_cache_data_out = next_alu_cache;
	 end

endmodule
