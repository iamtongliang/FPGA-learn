`include "/home/liang-tong/learn/lang/verilog/adder/unsignadder/adderf1.v"

module signripplefulladder_x #(
    parameter chainNumber = 8
) (
    input [chainNumber-1:0 ] X,
    input [chainNumber-1:0] Y,
    input  Carryin, 
    output Carryout,
    output [chainNumber-1:0] Sum,
    input clk1
); 
    reg [chainNumber-1:0] Xreg,Yreg;
    wire [chainNumber-1:0] Sumreg;
    reg [chainNumber:0] Carryinreg;
    wire [chainNumber:0] Carryoutreg;
    reg newdata;
    initial begin
        Xreg = 0;
        Yreg = 0;
        Carryinreg = 0;
        newdata = 0;
    end
    always @(*) begin
        Xreg = X;
        Yreg = Y;
        Carryinreg[0] = Carryin;
        newdata = 1'b1;
    end
    genvar i;
    generate
        for ( i=0; i<chainNumber; i=i+1) begin:label
            fulladder_1 fx(X[i],Y[i],Carryinreg[i],Carryoutreg[i],Sumreg[i],clk1);
            always @(Carryoutreg[i]) begin
                Carryinreg[i+1] = Carryoutreg[i];
            end
        end
    endgenerate
   
    reg [chainNumber-1:0] Sumbuf;
    reg Carryoutbuf;

    integer j=0;
    always @(*) begin
        newdata = 1'b1;
        Sumbuf[chainNumber-1] = (X[chainNumber-1]^Y[chainNumber-1])^(Carryinreg[chainNumber]);//^Carryinreg[chainNumber-1]);

        Carryoutbuf = (~(X[chainNumber-1]|Y[chainNumber-1])&Carryinreg[chainNumber-1])|
        ((X[chainNumber-1]&Y[chainNumber-1])&Carryinreg[chainNumber])&
        (~(Carryinreg[chainNumber]&Carryinreg[chainNumber-1]));
        
        for ( j=0;j<chainNumber-1;j=j+1) begin
            Sumbuf[j] = Sumreg[j]&(~Carryoutbuf);
        end            
    end


    assign Carryout = Carryoutbuf&(newdata);
    assign Sum = Sumbuf&{chainNumber{newdata}};

    always @(negedge clk1) begin
        #1 newdata = 1'b0;
    end
    assign Carryout = Carryoutbuf&(newdata);
    assign Sum = Sumbuf&{chainNumber{newdata}};

endmodule






