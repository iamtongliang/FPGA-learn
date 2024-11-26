`include "/home/liang-tong/learn/lang/verilog/HDLBitsexecises/diff8ar.v"
`default_nettype none   

module tb_diff8ar;
reg [7:0] d;
wire [7:0] y;
reg reset,clk;

localparam CLK_PERIOD = 10;
always #(CLK_PERIOD/2) clk=~clk;

diff8ar dut(.clk(clk), .areset(reset), .d(d), .q(y));

initial begin
    $dumpfile("tb_diff8ar.vcd");
    $dumpvars(0, tb_diff8ar);
end

initial begin
    reset<=1'b1;clk<=1'b0;
    #(CLK_PERIOD) reset<=1;clk<=0;    
end

always @(posedge clk) begin
    #(CLK_PERIOD/2) d=8'h24;reset=1;
    #(CLK_PERIOD*2) reset=0;
    #(CLK_PERIOD*3) reset=1;
    #(CLK_PERIOD) reset=1;
    #(CLK_PERIOD/2) reset=1;
    #(CLK_PERIOD/2) reset=0;
    #(CLK_PERIOD/2) d=8'h81;
    #(CLK_PERIOD) d=8'h9;
    #(CLK_PERIOD) d=8'h63;
    #(CLK_PERIOD) d=8'hd;
    #(CLK_PERIOD) d=8'h8d;
    #(CLK_PERIOD) d=8'h65;
    //#(CLK_PERIOD) reset=1;
    #(CLK_PERIOD)  reset=1;d=8'h12;
    #(CLK_PERIOD/2) reset=0;
    #(CLK_PERIOD/2) d=8'h1;
    //#(CLK_PERIOD) d=8'h1;
    #(CLK_PERIOD) d=8'hd;
    #(CLK_PERIOD*2) $finish(2);
    end

endmodule
`default_nettype wire
