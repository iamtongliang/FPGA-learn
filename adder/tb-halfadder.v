`timescale 10ns/1ns
module top_module ();
//clk define and start
	reg clk=0;
	always #5 clk = ~clk;  // Create clock with period=10
	initial `probe_start;   // Start the timing diagram

	`probe(clk);        // Probe signal "clk"


    reg [3:0] a, b, a1, b1;

    wire  c, c1;
    wire [3:0] sum, sum1;

initial begin
 	
    a = 4'h3;
    b = 4'h2;
    a1 = a+1;
    b1 = b+1;
    #5 a = 4'd7;
    b = 4'd8;
    a1 = a+1;
    b1 = b+1;    
    #5 a = 4'd9;
    b = 4'd10;
    a1 = a+1;
    b1 = b+1;        
    #5 a = 4'd15;
    b = 4'd15; 
    a1 = a+1;
    b1 = b+1;    
    #5
    a = 4'd0;
    b = 4'd15;
    a1 = a+1;
    b1 = b+1;    
    #5 a = 4'd7;
    b = 4'd1;
    a1 = a+1;
    b1 = b+1;    
    #5 a = 4'd3;
    b = 4'd10;
    a1 = a+1;
    b1 = b+1;    
    #5 a = 4'd7;
    b = 4'd15; 
    a1 = a+1;
    b1 = b+1;    
    #5 a = 4'd7;
    b = 4'd12;
    a1 = a+1;
    b1 = b+1;    
    #5 a = 4'd11;
    b = 4'd15; 
    a1 = a+1;
    b1 = b+1;
        

    #5 $finish;            // Quit the simulation
end

    ripplefullhalfadder_4 ex(.X(a),.Y(b),.C(c),.Sum(sum),.clk1(clk));
    `probe(a);
    `probe(b);
    `probe(c);
    `probe(sum);
    ripplefullhalfadder_4 ex1(.X(a1),.Y(b1),.C(c1),.Sum(sum1),.clk1(clk));
    `probe(a1);
    `probe(b1);
    `probe(c1);
    `probe(sum1);

endmodule


module ripplefullhalfadder_4( X,Y,C,Sum,clk1); 
    input [3:0] X;
    input [3:0] Y;
    output  [3:0] Sum;
    output  C;
	input clk1;

    wire [4:0] Cin;
   
halfadder_1 h1(
	.X(X[0]),
	.Y(Y[0]),
	.C(Cin[0]),
    .Sum(Sum[0]),
	.clk1(clk1)
	);

fulladder_1 f1(
	.X(X[1]),
	.Y(Y[1]),
    .Cin(Cin[0]),
    .C(Cin[1]),
    .Sum(Sum[1]),
	.clk1(clk1)
	);

	
fulladder_1 f2(
	.X(X[2]),
	.Y(Y[2]),
    .Cin(Cin[1]),
    .C(Cin[2]),
    .Sum(Sum[2]),
	.clk1(clk1)
	);
	
fulladder_1 f3(
	.X(X[3]),
	.Y(Y[3]),
    .Cin(Cin[2]),
    .C(Cin[3]),
    .Sum(Sum[3]),
	.clk1(clk1)
	);
    assign C = Cin[3];

endmodule


module fulladder_1 (
    input  [0:0] X,
    input  [0:0] Y,
    input [0:0] Cin,
    output [0:0] C,
    output [0:0]  Sum,
    input clk1);
    
    reg [1:0] buff;
    reg Xreg, Yreg, Cinreg;
    initial begin
        assign Xreg = X;
        assign Yreg = Y;
        assign Cinreg = Cin;
    end
    
    always @ (*)
        begin
			Xreg = X;
			Yreg = Y;
			Cinreg = Cin; 
            buff[0] = (Xreg^Yreg)^Cinreg;
            buff[1] = (Xreg&Yreg)|Cinreg&(Xreg^Yreg);
        end
    assign  Sum = buff[0];
    assign  C = buff[1];
endmodule


module halfadder_1(X,Y,C,Sum,clk1);
    input X,Y;
    output reg C;
    output reg Sum;
    input clk1;

    reg [1:0] buff;
    reg Xreg, Yreg;
    initial begin
        assign Xreg = X;
        assign Yreg = Y;
    end
    always @ (*)
        begin
            buff[0] = Xreg^Yreg;
            buff[1] = Xreg&Yreg;
        end
    
    assign Sum = buff[0];
    assign C = buff[1];
endmodule