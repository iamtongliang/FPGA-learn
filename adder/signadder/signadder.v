`include "/home/liang-tong/learn/lang/verilog/adder/signadder/complement2code.v"
`include "/home/liang-tong/learn/lang/verilog/adder/signadder/signripplefulladder_x.v"


module signadder #(
    parameter bitNUmber = 8
) (
    input [bitNUmber-1:0] A, 
    input [bitNUmber-1:0] B,
    output Carry,
    output [bitNUmber-1:0] Sum,
    input clk1
);
    
    reg [bitNUmber-1:0] Ainbuf,Binbuf;
    wire [bitNUmber-1:0] Sumbuf;
    wire [bitNUmber-1:0] Aoutbuf,Boutbuf;
    wire Carryoutbuf;
    wire [bitNUmber-1:0] Xinbuf,Yinbuf;
    reg newdata;
    initial begin
        Ainbuf = 0;
        Binbuf = 0;
        newdata = 1'b0;
    end
    always @(posedge clk1) begin
        #1;
        Ainbuf = A;
        Binbuf = B;
        newdata = 1'b1;
    end
    ComplimentCode #(.bitNumber(bitNUmber)) cc(.A(Ainbuf),.B(Binbuf),.Aout(Aoutbuf),.Bout(Boutbuf),.clk1(clk1));
    signripplefulladder_x #(.chainNumber(bitNUmber)) fa(.X(Aoutbuf),.Y(Boutbuf),.Carryin(1'b0),.Carryout(Carryoutbuf),.Sum(Sumbuf),.clk1(clk1));
    
    assign Carry = Carryoutbuf&newdata;
    assign Sum = Sumbuf&{bitNUmber{newdata}};

    always @(negedge clk1) begin
        #1 newdata = 1'b0;
    end

    assign Carry = Carryoutbuf&newdata;
    assign Sum = Sumbuf&{bitNUmber{newdata}};

endmodule