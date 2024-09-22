`timescale 10ns/1ns

//`include "/home/liang-tong/learn/lang/verilog/adder/unsignadder/addeh1r.v"
//`include "/home/liang-tong/learn/lang/verilog/adder/unsignadder/adderf1.v"

module ripplefullhalfadder_4( X,Y,C,Sum,clk1); 
    input[3:0] X,Y;
    output  [3:0] Sum;
    output  C;
	input clk1;

    wire [3:0] Cin;

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