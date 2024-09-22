`timescale 10ns/1ns

module halfadder_1(X,Y,C,Sum,clk1);
    input X,Y;
    output  C;
    output  Sum;
    input clk1;

    reg [1:0] buff;
    wire Xreg, Yreg;

    assign Xreg = X;
    assign Yreg = Y;
    always @ (*) begin
            buff[0] = Xreg^Yreg;
            buff[1] = Xreg&Yreg;
        end
    
    assign Sum = buff[0];
    assign C = buff[1];
endmodule