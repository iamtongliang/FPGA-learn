`include "/home/liang-tong/learn/lang/verilog/test/halfadder_1.v"
`default_nettype none
`timescale 10ns/10ns

module top_module();
reg clk;
reg X,Y;
wire C1,Sum1;


localparam CLK_PERIOD = 10;
always #(CLK_PERIOD/2) clk=~clk;

initial begin
    $dumpfile("tb_addeh1r.vcd");
    $dumpvars(0, top_module);
end

initial begin
    #5 X=1'b0;
    Y=1'b0;
    #5 X=1'b0;
    Y=1'b1;
    #5 X=1'b1;
    Y=1'b1;
    #5 X=1'b1;
    Y=1'b0;
    #5 X=1'b0;
    Y=1'b0;
     
    #10 $finish();
end
halfadder_1 h1r
(
    .X(X),
    .Y(Y),
    .C(C1),
    .Sum(Sum1),
    .clk1(clk)
);

endmodule
`default_nettype wire