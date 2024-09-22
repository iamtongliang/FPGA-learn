
`include "/home/liang-tong/learn/lang/verilog/adder/unsignadder/adderf1.v"

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
    reg [chainnumber-1:0] Xreg,Yreg;
    wire [chainnumber-1:0] Sumreg;
    reg [chainnumber:0] Carryinreg;
    wire [chainnumber:0] Carryoutreg;
    
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
    assign  Carryout = Carryinreg[chainnumber];
    assign  Sum = Sumreg;
endmodule