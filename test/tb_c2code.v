
`timescale 1ns/100ps

`include "/home/liang-tong/learn/lang/verilog/test/complement2code.v"
`default_nettype none

module tb_c2code();
reg clk;

localparam CLK_PERIOD = 10;
always #(CLK_PERIOD/2) clk=~clk;

initial begin
    $dumpfile("tb_c2code.vcd");
    $dumpvars(0, tb_c2code);
end

reg [7:0] ina=0, inb=0;
wire [7:0] outa, outb;
integer i;
initial begin
    for ( i=0;i<=63;i=i+1) begin
        #5 ina = i;
        inb = i&7'h3f|7'h40;
     end
   
    #5 $finish;            // Quit the simulation
end

ComplimentCode #(.bitNumber(7)) inst1 ( .A(ina),.B(inb),.Aout(outa),.Bout(outb),.clk1(clk) );   // Sub-modules work too.

endmodule
`default_nettype wire