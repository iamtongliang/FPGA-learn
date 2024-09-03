`timescale 100ns/10ns
module top_module ();
	reg clk=0;
	always #1 clk = ~clk;  // Create clock with period=10
	initial `probe_start;   // Start the timing diagram

	`probe(clk);        // Probe signal "clk"

	// A testbench
    reg [3:0] A=4'd0, B=4'd0;
    wire less, more, equal;
	initial begin
		#1 A = 4'd0;
        B = 4'd0;
		#1 A = 4'd0;
		B = 4'd1;
		#1 A = 4'd0;
        B = 4'd2;
        #1 A = 4'd0;
        B = 4'd3;
		#1 A = 4'd0;
        B = 4'd4;
		#1 A = 4'd0;
		B = 4'd5;
		#1 A = 4'd0;
        B = 4'd6;
        #1 A = 4'd0;
        B = 4'd07;
		#1 A = 4'd0;
        B = 4'd8;
		#1 A = 4'd0;
		B = 4'd9;
		#1 A = 4'd0;
        B = 4'd10;
        #1 A = 4'd0;
        B = 4'd11;
		#1 A = 4'd0;
        B = 4'd12;
		#1 A = 4'd0;
		B = 4'd13;
		#1 A = 4'd0;
        B = 4'd14;
        #1 A = 4'd0;
        B = 4'd15;
		#1 A = 4'd1;
        B = 4'd0;
		#1 A = 4'd1;
		B = 4'd1;
		#1 A = 4'd1;
        B = 4'd2;
        #1 A = 4'd1;
        B = 4'd3;
		#1 A = 4'd1;
        B = 4'd4;
		#1 A = 4'd1;
		B = 4'd5;
		#1 A = 4'd1;
        B = 4'd6;
        #1 A = 4'd1;
        B = 4'd07;
		#1 A = 4'd1;
        B = 4'd8;
		#1 A = 4'd1;
		B = 4'd9;
		#1 A = 4'd1;
        B = 4'd10;
        #1 A = 4'd1;
        B = 4'd11;
		#1 A = 4'd1;
        B = 4'd12;
		#1 A = 4'd1;
		B = 4'd13;
		#1 A = 4'd1;
        B = 4'd14;
        #1 A = 4'd1;
        B = 4'd15;
		#1 A = 4'd2;
        B = 4'd0;
		#1 A = 4'd2;
		B = 4'd1;
		#1 A = 4'd2;
        B = 4'd2;
        #1 A = 4'd2;
        B = 4'd3;
		#1 A = 4'd2;
        B = 4'd4;
		#1 A = 4'd2;
		B = 4'd5;
		#1 A = 4'd2;
        B = 4'd6;
        #1 A = 4'd2;
        B = 4'd07;
		#1 A = 4'd2;
        B = 4'd8;
		#1 A = 4'd2;
		B = 4'd9;
		#1 A = 4'd2;
        B = 4'd10;
        #1 A = 4'd2;
        B = 4'd11;
		#1 A = 4'd2;
        B = 4'd12;
		#1 A = 4'd2;
		B = 4'd13;
		#1 A = 4'd2;
        B = 4'd14;
        #1 A = 4'd2;
        B = 4'd15;
		#1 A = 4'd3;
        B = 4'd0;
		#1 A = 4'd3;
		B = 4'd1;
		#1 A = 4'd3;
        B = 4'd2;
        #1 A = 4'd3;
        B = 4'd3;
		#1 A = 4'd3;
        B = 4'd4;
		#1 A = 4'd3;
		B = 4'd5;
		#1 A = 4'd3;
        B = 4'd6;
        #1 A = 4'd3;
        B = 4'd07;
		#1 A = 4'd3;
        B = 4'd8;
		#1 A = 4'd3;
		B = 4'd9;
		#1 A = 4'd3;
        B = 4'd10;
        #1 A = 4'd3;
        B = 4'd11;
		#1 A = 4'd3;
        B = 4'd12;
		#1 A = 4'd3;
		B = 4'd13;
		#1 A = 4'd3;
        B = 4'd14;
        #1 A = 4'd3;
        B = 4'd15;
		#1 A = 4'd4;
        B = 4'd0;
		#1 A = 4'd4;
		B = 4'd1;
		#1 A = 4'd4;
        B = 4'd2;
        #1 A = 4'd4;
        B = 4'd3;
		#1 A = 4'd4;
        B = 4'd4;
		#1 A = 4'd4;
		B = 4'd5;
		#1 A = 4'd4;
        B = 4'd6;
        #1 A = 4'd4;
        B = 4'd07;
		#1 A = 4'd4;
        B = 4'd8;
		#1 A = 4'd4;
		B = 4'd9;
		#1 A = 4'd4;
        B = 4'd10;
        #1 A = 4'd4;
        B = 4'd11;
		#1 A = 4'd4;
        B = 4'd12;
		#1 A = 4'd4;
		B = 4'd13;
		#1 A = 4'd4;
        B = 4'd14;
        #1 A = 4'd4;
        B = 4'd15;
		#1 A = 4'd5;
        B = 4'd0;
		#1 A = 4'd5;
		B = 4'd1;
		#1 A = 4'd5;
        B = 4'd2;
        #1 A = 4'd5;
        B = 4'd3;
		#1 A = 4'd5;
        B = 4'd4;
		#1 A = 4'd5;
		B = 4'd5;
		#1 A = 4'd5;
        B = 4'd6;
        #1 A = 4'd5;
        B = 4'd07;
		#1 A = 4'd5;
        B = 4'd8;
		#1 A = 4'd5;
		B = 4'd9;
		#1 A = 4'd5;
        B = 4'd10;
        #1 A = 4'd5;
        B = 4'd11;
		#1 A = 4'd5;
        B = 4'd12;
		#1 A = 4'd5;
		B = 4'd13;
		#1 A = 4'd5;
        B = 4'd14;
        #1 A = 4'd5;
        B = 4'd15;
		#1 A = 4'd6;
        B = 4'd0;
		#1 A = 4'd6;
		B = 4'd1;
		#1 A = 4'd6;
        B = 4'd2;
        #1 A = 4'd6;
        B = 4'd3;
		#1 A = 4'd6;
        B = 4'd4;
		#1 A = 4'd6;
		B = 4'd5;
		#1 A = 4'd6;
        B = 4'd6;
        #1 A = 4'd6;
        B = 4'd07;
		#1 A = 4'd6;
        B = 4'd8;
		#1 A = 4'd6;
		B = 4'd9;
		#1 A = 4'd6;
        B = 4'd10;
        #1 A = 4'd6;
        B = 4'd11;
		#1 A = 4'd6;
        B = 4'd12;
		#1 A = 4'd6;
		B = 4'd13;
		#1 A = 4'd6;
        B = 4'd14;
        #1 A = 4'd6;
        B = 4'd15;
        //
		#1 A = 4'd7;
        B = 4'd0;
		#1 A = 4'd7;
		B = 4'd1;
		#1 A = 4'd7;
        B = 4'd2;
        #1 A = 4'd7;
        B = 4'd3;
		#1 A = 4'd7;
        B = 4'd4;
		#1 A = 4'd7;
		B = 4'd5;
		#1 A = 4'd7;
        B = 4'd6;
        #1 A = 4'd7;
        B = 4'd07;
		#1 A = 4'd7;
        B = 4'd8;
		#1 A = 4'd7;
		B = 4'd9;
		#1 A = 4'd7;
        B = 4'd10;
        #1 A = 4'd7;
        B = 4'd11;
		#1 A = 4'd7;
        B = 4'd12;
		#1 A = 4'd7;
		B = 4'd13;
		#1 A = 4'd7;
        B = 4'd14;
        #1 A = 4'd7;
        B = 4'd15;
        
		#1 A = 4'd8;
        B = 4'd0;
		#1 A = 4'd8;
		B = 4'd1;
		#1 A = 4'd8;
        B = 4'd2;
        #1 A = 4'd8;
        B = 4'd3;
		#1 A = 4'd8;
        B = 4'd4;
		#1 A = 4'd8;
		B = 4'd5;
		#1 A = 4'd8;
        B = 4'd6;
        #1 A = 4'd8;
        B = 4'd07;
		#1 A = 4'd8;
        B = 4'd8;
		#1 A = 4'd8;
		B = 4'd9;
		#1 A = 4'd8;
        B = 4'd10;
        #1 A = 4'd8;
        B = 4'd11;
		#1 A = 4'd8;
        B = 4'd12;
		#1 A = 4'd8;
		B = 4'd13;
		#1 A = 4'd8;
        B = 4'd14;
        #1 A = 4'd8;
        B = 4'd15;
        
		#1  A = 4'd9;
        B = 4'd0;
		#1  A = 4'd9;
		B = 4'd1;
		#1  A = 4'd9;
        B = 4'd2;
        #1  A = 4'd9;
        B = 4'd3;
		#1  A = 4'd9;
        B = 4'd4;
		#1  A = 4'd9;
		B = 4'd5;
		#1  A = 4'd9;
        B = 4'd6;
        #1  A = 4'd9;
        B = 4'd07;
		#1  A = 4'd9;
        B = 4'd8;
		#1  A = 4'd9;
		B = 4'd9;
		#1  A = 4'd9;
        B = 4'd10;
        #1  A = 4'd9;
        B = 4'd11;
		#1  A = 4'd9;
        B = 4'd12;
		#1  A = 4'd9;
		B = 4'd13;
		#1  A = 4'd9;
        B = 4'd14;
        #1  A = 4'd9;
        B = 4'd15;
        
		#1 A = 4'd10;
        B = 4'd0;
		#1 A = 4'd10;
		B = 4'd1;
		#1 A = 4'd10;
        B = 4'd2;
        #1 A = 4'd10;
        B = 4'd3;
		#1 A = 4'd10;
        B = 4'd4;
		#1 A = 4'd10;
		B = 4'd5;
		#1 A = 4'd10;
        B = 4'd6;
        #1 A = 4'd10;
        B = 4'd07;
		#1 A = 4'd10;
        B = 4'd8;
		#1 A = 4'd10;
		B = 4'd9;
		#1 A = 4'd10;
        B = 4'd10;
        #1 A = 4'd10;
        B = 4'd11;
		#1 A = 4'd10;
        B = 4'd12;
		#1 A = 4'd10;
		B = 4'd13;
		#1 A = 4'd10;
        B = 4'd14;
        #1 A = 4'd10;
        B = 4'd15;
        
		#1 A = 4'd11;
        B = 4'd0;
		#1 A = 4'd11;
		B = 4'd1;
		#1 A = 4'd11;
        B = 4'd2;
        #1 A = 4'd11;
        B = 4'd3;
		#1 A = 4'd11;
        B = 4'd4;
		#1 A = 4'd11;
		B = 4'd5;
		#1 A = 4'd11;
        B = 4'd6;
        #1 A = 4'd11;
        B = 4'd07;
		#1 A = 4'd11;
        B = 4'd8;
		#1 A = 4'd11;
		B = 4'd9;
		#1 A = 4'd11;
        B = 4'd10;
        #1 A = 4'd11;
        B = 4'd11;
		#1 A = 4'd11;
        B = 4'd12;
		#1 A = 4'd11;
		B = 4'd13;
		#1 A = 4'd11;
        B = 4'd14;
        #1 A = 4'd11;
        B = 4'd15;
        
		#1 A = 4'd12;
        B = 4'd0;
		#1 A = 4'd12;
		B = 4'd1;
		#1 A = 4'd12;
        B = 4'd2;
        #1 A = 4'd12;
        B = 4'd3;
		#1 A = 4'd12;
        B = 4'd4;
		#1 A = 4'd12;
		B = 4'd5;
		#1 A = 4'd12;
        B = 4'd6;
        #1 A = 4'd12;
        B = 4'd07;
		#1 A = 4'd12;
        B = 4'd8;
		#1 A = 4'd12;
		B = 4'd9;
		#1 A = 4'd12;
        B = 4'd10;
        #1 A = 4'd12;
        B = 4'd11;
		#1 A = 4'd12;
        B = 4'd12;
		#1 A = 4'd12;
		B = 4'd13;
		#1 A = 4'd12;
        B = 4'd14;
        #1 A = 4'd12;
        B = 4'd15;
        
		#1 A = 4'd13;
        B = 4'd0;
		#1 A = 4'd13;
		B = 4'd1;
		#1 A = 4'd13;
        B = 4'd2;
        #1 A = 4'd13;
        B = 4'd3;
		#1 A = 4'd13;
        B = 4'd4;
		#1 A = 4'd13;
		B = 4'd5;
		#1 A = 4'd13;
        B = 4'd6;
        #1 A = 4'd13;
        B = 4'd07;
		#1 A = 4'd13;
        B = 4'd8;
		#1 A = 4'd13;
		B = 4'd9;
		#1 A = 4'd13;
        B = 4'd10;
        #1 A = 4'd13;
        B = 4'd11;
		#1 A = 4'd13;
        B = 4'd12;
		#1 A = 4'd13;
		B = 4'd13;
		#1 A = 4'd13;
        B = 4'd14;
        #1 A = 4'd13;
        B = 4'd15;
        
		#1 A = 4'd14;
        B = 4'd0;
		#1 A = 4'd14;
		B = 4'd1;
		#1 A = 4'd14;
        B = 4'd2;
        #1 A = 4'd14;
        B = 4'd3;
		#1 A = 4'd14;
        B = 4'd4;
		#1 A = 4'd14;
		B = 4'd5;
		#1 A = 4'd14;
        B = 4'd6;
        #1 A = 4'd14;
        B = 4'd07;
		#1 A = 4'd14;
        B = 4'd8;
		#1 A = 4'd14;
		B = 4'd9;
		#1 A = 4'd14;
        B = 4'd10;
        #1 A = 4'd14;
        B = 4'd11;
		#1 A = 4'd14;
        B = 4'd12;
		#1 A = 4'd14;
		B = 4'd13;
		#1 A = 4'd14;
        B = 4'd14;
        #1 A = 4'd14;
        B = 4'd15;        
		#1 A = 4'd15;
        B = 4'd0;
		#1 A = 4'd15;
		B = 4'd1;
		#1 A = 4'd15;
        B = 4'd2;
        #1 A = 4'd15;
        B = 4'd3;
		#1 A = 4'd15;
        B = 4'd4;
		#1 A = 4'd15;
		B = 4'd5;
		#1 A = 4'd15;
        B = 4'd6;
        #1 A = 4'd15;
        B = 4'd07;
		#1 A = 4'd15;
        B = 4'd8;
		#1 A = 4'd15;
		B = 4'd9;
		#1 A = 4'd15;
        B = 4'd10;
        #1 A = 4'd15;
        B = 4'd11;
		#1 A = 4'd15;
        B = 4'd12;
		#1 A = 4'd15;
		B = 4'd13;
		#1 A = 4'd15;
        B = 4'd14;
        #1 A = 4'd15;
        B = 4'd15;
        
		$display ("Hello world! The current time is (%0d ps)", $time);
		#1 $finish;            // Quit the simulation
	end

    cmp4bit cmp4 ( .A(A), .B(B), .equal(equal), .more(more), .less(less) );   // Sub-modules work too.
    `probe(A);
    `probe(B);
	`probe(equal);
    `probe(less);
    `probe(more);
    
endmodule

module cmp4bit( A, B, equal, more, less);
	parameter datalength = 4;
	
    input [datalength-1:0] A, B;
	output equal, more, less;
	input clock;
	
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


module cmp2bit( A, B, equal, more, less);
	parameter datalength = 2;
	
	input [1:0] A, B;
	output equal, more, less;

	
	wire [datalength-1:0] interE, interM, interL;
	
	initial
	begin

	end
	cmp1bit unit1(
	.A(A[1]),
	.B(B[1]),
	.equal(interE[1]),
	.more(interM[1]),
	.less(interL[1]));

	cmp1bit unit0(
        .A(A[0]),
        .B(B[0]),
        .equal(interE[0]),
        .more(interM[0]),
        .less(interL[0]));
	

    assign equal = interE[1]&interE[0];
    assign more = (interM[1]|interE[1])&(interM[1]|(interM[0]&(~equal)));
    assign less = (~equal)&(~more);
endmodule

module cmp1bit( A, B, equal, more, less);
	input A, B;
	output equal, more, less;
    
	assign equal = ~(A^B);
	assign more = A&(~equal);
	assign less = B&(~equal);
	
endmodule
