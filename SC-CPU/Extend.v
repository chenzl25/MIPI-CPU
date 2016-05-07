`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:24:19 04/15/2016 
// Design Name: 
// Module Name:    Extend 
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
module Extend(
    ExtAddr,
    ExtSel,
    ExtOut
    );
	  input [15:0] ExtAddr;
	  input ExtSel;
	  output [31:0] ExtOut;
	  reg [31:0] ExtOut;
	always @(ExtSel or ExtAddr) begin
		if (ExtSel == 0)
			ExtOut = {{16{1'b0}},ExtAddr[15:0]};
		else if (ExtSel == 1)
			ExtOut = {{16{ExtAddr[15]}},ExtAddr[15:0]};
	end

endmodule
