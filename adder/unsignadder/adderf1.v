`timescale 100ps/1ps

module fulladder_1 (
    input  X,
	input  Y,
	input Cin,
	output   C,
    output   Sum,
    input clk1
    );
    
    reg [1:0] buff;
    reg Xreg, Yreg, Cinreg;
    initial begin
        buff = 0;
        Xreg = 0;
        Yreg = 0;
        Cinreg = 0;
    end
    always @ (X,Y,Cin,clk1) begin
        Xreg = X;
        Yreg = Y;
        Cinreg = Cin;

        buff[0] = (Xreg^Yreg)^Cinreg;
        buff[1] = (Xreg&Yreg)|Cinreg&(Xreg^Yreg);
        end
        
    assign  Sum = buff[0];
    assign  C = buff[1];
endmodule