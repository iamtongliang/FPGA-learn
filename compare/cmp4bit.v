//`timescale 10ns/1ns
`include "cmp2bit.v"

module cmp4bit( A, B, equal, more, less);
	parameter datalength = 4;
	
    input [datalength-1:0] A, B;
	output equal, more, less;

	
	wire [1:0] interE, interM, interL;
   
	initial
	begin
	end
	cmp2bit unit1(
        .A(A[datalength-1:datalength-2]),
        .B(B[datalength-1:datalength-2]),
	.equal(interE[1]),
	.more(interM[1]),
	.less(interL[1]));

	cmp2bit unit0(
        .A(A[datalength-3:0]),
        .B(B[datalength-3:0]),
        .equal(interE[0]),
        .more(interM[0]),
        .less(interL[0]));
    
    assign equal = interE[1]&interE[0];
    assign more = (interM[1]|interE[1])&(interM[1]|(interM[0]&(~equal)));
    assign less = (~equal)&(~more);
	
	
endmodule
