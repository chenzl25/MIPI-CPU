`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:38:43 04/15/2016 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
     a,
     b,
     s,
     result,
     zero
    );
	 
	 input [31:0] a, b;
	 input [2:0] s;
	 output zero;
	 output reg [31:0] result;
	 assign zero = (result == 32'h0000)? 1: 0;
	 always@(s or a or b) begin
		case(s)
			3'b000: result<= a+b;
			3'b001: result<= a-b;
			3'b010: result<= (a-b<0)?1:0 ;
			3'b011: result<= (a >> b);
			3'b100: result<= (a << b);
			3'b101: result<= a|b;
			3'b110: result<= a&b;
			3'b111: result<= (a^b);
		endcase
	end
endmodule
