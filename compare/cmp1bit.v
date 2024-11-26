//`timescale 10ns/1ns

module cmp1bit( A, B, equal, more, less, clock);
	input A, B;
	output equal, more, less;
	input clock;
	
	assign equal = ~(A^B);
	assign more = A&(~equal);
	assign less = B&(~equal);


endmodule