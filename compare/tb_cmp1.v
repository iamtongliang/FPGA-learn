`include "/home/liang-tong/learn/lang/verilog/compare/cmp1bit.v"
`default_nettype none

module tb_cmp1bit();
reg clk;
reg rst_n;
reg Ain, Bin;
wire great, less , equal;

cmp1bit cmp1
(
    .A(Ain),.B(Bin),.equal(equal),.more(great),.less(less),
    .clock (clk)
);

localparam CLK_PERIOD = 10;
always #(CLK_PERIOD/2) clk=~clk;

initial begin
    $dumpfile("tb_cmp1bit.vcd");
    $dumpvars(0, tb_cmp1bit);
end

initial begin
    #1 rst_n<=1'bx;clk<=1'bx;
    #(CLK_PERIOD) rst_n<=1;
    #(CLK_PERIOD) rst_n<=0;clk<=0;
    
    rst_n<=1;
end
    always @(posedge clk) begin
    #(CLK_PERIOD) Ain=0;Bin=0;
    #(CLK_PERIOD) Ain=0;Bin=1;
    #(CLK_PERIOD) Ain=1;Bin=0;
    #(CLK_PERIOD) Ain=1;Bin=1;
    #(CLK_PERIOD) $finish(2);
    end

endmodule
`default_nettype wire