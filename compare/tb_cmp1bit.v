module top_module ();
	reg clk=0;
	always #5 clk = ~clk;  // Create clock with period=10
	initial `probe_start;   // Start the timing diagram

	`probe(clk);        // Probe signal "clk"

	// A testbench
    reg [0:0] A=1'b0, B=1'b0;
    wire less, more, equal;
	initial begin
		#10 A <= 0;
        #10 B <= 0;
		#20 A <= 0;
		#20 B <= 1;
		#30 A <= 1;
        #30 B <= 0;
        #40 A <= 1;
        #40 B <= 1;
		$display ("Hello world! The current time is (%0d ps)", $time);
		#50 $finish;            // Quit the simulation
	end

    cmp1bit cmp1 ( .A(A), .B(B), .equal(equal), .more(more), .less(less) );   // Sub-modules work too.
    `probe(A);
    `probe(B);
	`probe(equal);
    `probe(less);
    `probe(more);
    
endmodule
