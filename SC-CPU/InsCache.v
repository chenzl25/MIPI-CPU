`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:29:17 05/06/2016 
// Design Name: 
// Module Name:    InsCache 
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
module InsCache(
    input clk,
    input [31:0] ins_cache_data_in,
    ins_cache_data_out
    );
	output reg [31:0] ins_cache_data_out;
	 reg [31:0] next_alu_cache;
	 
	 always @(negedge clk) begin
		next_alu_cache = ins_cache_data_in;
	 end
	 always @(posedge clk) begin 
		ins_cache_data_out = next_alu_cache;
	 end

endmodule
