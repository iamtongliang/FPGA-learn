`timescale 100ns/10ns
module top_module ();
	reg clk=0;
	always #1 clk = ~clk;  // Create clock with period=10
	initial `probe_start;   // Start the timing diagram

	`probe(clk);        // Probe signal "clk"

	// A testbench
    reg [1:0] A=2'b00, B=2'b00;
    wire less, more, equal;
	initial begin
		#1 A <= 2'b00;
        B <= 2'b00;
		#1 A <= 2'b00;
		B <= 2'b01;
		#1 A <= 2'b00;
        B <= 2'b10;
        #1 A <= 2'b00;
        B <= 2'b11;
		#1 A <= 2'b01;
        B <= 2'b00;
		#1 A <= 2'b01;
		B <= 2'b01;
		#1 A <= 2'b01;
        B <= 2'b10;
        #1 A <= 2'b01;
        B <= 2'b11;
		#1 A <= 2'b10;
        B <= 2'b00;
		#1 A <= 2'b10;
		B <= 2'b01;
		#1 A <= 2'b10;
        B <= 2'b10;
        #1 A <= 2'b10;
        B <= 2'b11;
		#1 A <= 2'b11;
        B <= 2'b00;
		#1 A <= 2'b11;
		B <= 2'b01;
		#1 A <= 2'b11;
        B <= 2'b10;
        #1 A <= 2'b11;
        B <= 2'b11;
        #1 A <= 'b00;
        B <= 'b00;
        
		$display ("Hello world! The current time is (%0d ps)", $time);
		#1 $finish;            // Quit the simulation
	end

    cmp2bit cmp2 ( .A(A), .B(B), .equal(equal), .more(more), .less(less) );   // Sub-modules work too.
    `probe(A);
    `probe(B);
	`probe(equal);
    `probe(less);
    `probe(more);
    
endmodule

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


module cmp1bit( A, B, equal, more, less);
	input A, B;
	output equal, more, less;
    
	assign equal = ~(A^B);
	assign more = A&(~equal);
	assign less = B&(~equal);
	
endmodule
