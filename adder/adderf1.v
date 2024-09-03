`timescale 10ns/1ns

module fulladder_1 (
    input  X,
	input  Y,
	input Cin,
	output   C,
    output   Sum,
    input clk1,
    );
    
    reg [1:0] buff;
    reg Xreg, Yreg, Cinreg;
    initial begin
        assign Xreg = X;
        assign Yreg = Y;
        assign Cinreg = Cin;
        end
    always @ (*) begin
        buff[0] = (Xreg^Yreg)^Cinreg;
        buff[1] = (Xreg&Yreg)|Cinreg&(Xreg^Yreg);
        end
        
    assign  Sum = buff[0];
    assign  C = buff[1];
endmodule