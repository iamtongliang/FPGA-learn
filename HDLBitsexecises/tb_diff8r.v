`include "/home/liang-tong/learn/lang/verilog/HDLBitsexecises/diff8r.v"
`default_nettype none

module tb_diff8r();
reg [7:0] d;
wire [7:0] q;
reg clk;
reg reset;

localparam CLK_PERIOD = 10;
always #(CLK_PERIOD/2) clk=~clk;

diff8r dut(.d(d), .q(q), .clk(clk), .reset(reset));

initial begin
    $dumpfile("tb_diff8r.vcd");
    $dumpvars(0, tb_diff8r);
end

initial begin
    reset<=1'b1;clk<=1'b0;
    #(CLK_PERIOD) reset<=1;clk<=0;    
end

always @(posedge clk) begin
    #(CLK_PERIOD) d=8'h24;reset=1;
    #(CLK_PERIOD*2) reset=0;
    #(CLK_PERIOD*3) reset=1;
    #(CLK_PERIOD*2) reset=0;d=8'h81;
    #(CLK_PERIOD) d=8'h9;
    #(CLK_PERIOD) d=8'h63;
    #(CLK_PERIOD) d=8'hd;
    #(CLK_PERIOD) d=8'h8d;
    #(CLK_PERIOD) d=8'h65;
    #(CLK_PERIOD) d=8'h12;
    #(CLK_PERIOD) d=8'h1;
    #(CLK_PERIOD) d=8'hd;
    #(CLK_PERIOD*2) $finish(2);
    end

endmodule
`default_nettype wire