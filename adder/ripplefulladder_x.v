`timescale 1ns/1ns

module ripplefullfadder_x #(
    parameter chainnumber = 8
) (
    input [chainnumber-1:0 ] X,
    input [chainnumber-1:0] Y,
    input  Carryin, 
    output Carryout,
    output [chainnumber-1:0] Sum,
    input clk1
); 
    reg [chainnumber-1:0] Xreg,Yreg,Sumreg;
    reg [chainnumber:0] Carryinreg;
    reg [chainnumber-1:0] Carryoutreg;

    always @(*) begin
        Xreg = X;
        Yreg = Y;
        Carryinreg[0] = Carryin;
    end
    genvar i;
    generate
        for ( i=0; i<chainnumber; i=i+1) begin:label
            fulladder_1 fx(X[i],Y[i],Carryinreg[i],Carryoutreg[i],Sumreg[i],clk1);
            always @(*) begin
                Carryinreg[i+1] = Carryoutreg[i];
            end
        end
    endgenerate
    assign  Carryout = Carryinreg[chainnumber-1];
    assign  Sum = Sumreg;
endmodule