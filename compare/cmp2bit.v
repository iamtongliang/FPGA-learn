//`timescale 10ns/1ns
`include "cmp1bit.v"

module cmp2bit( A, B, equal, more, less);
	parameter datalength = 2;
	
	input [datalength-1:0] A, B;
	output equal, more, less;

	
	wire [datalength-1:0] interE, interM, interL;
	
	initial
	begin

	end
	cmp1bit unit1(
	.A(A[datalength-1]),
	.B(B[datalength-1]),
	.equal(interE[datalength-1]),
	.more(interM[datalength-1]),
	.less(interL[datalength-1]));

	cmp1bit unit0(
	.A(A[datalength-datalength]),
	.B(B[datalength-datalength]),
	.equal(interE[datalength-datalength]),
	.more(interM[datalength-datalength]),
	.less(interL[datalength-datalength]));
	

	assign equal = interE[datalength-1]&interE[datalength-datalength];
    	assign more = (interM[datalength-1]|interE[datalength-1])&(interM[datalength-1]|(interM[datalength-datalength]&(~equal)));
    	assign less = (~equal)&(~more);
	
	
endmodule