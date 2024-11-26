//`timescale 10ns/1ns
/*
Path    Sel
0       0000
1       0001
2       0010
3       0011
4       0100
5       0101
6       0110
7       0111
8       1000
9       1001
10      1010
11      1011
12      1100
13      1101
14      1110
15      1111
*/
`include "sel2to4.v"

module sel4to16 (
    input [3:0] select,
    output [15:0] path,
    input clk1
);
    parameter limit = 4;
    reg [limit-1:0] Selreg;
    reg [limit*4-1:0] Pathreg;

    wire [limit*2-1:0] PathBuff;
	 always @ (*) begin
		Selreg = select;
	 end
    sel2to4 se1(.select(Selreg[limit-1:limit-2]), .path(PathBuff[limit*2-1:limit]), .clk1(clk1));
    sel2to4 se0(.select(Selreg[limit-3:limit-limit]), .path(PathBuff[limit-1:limit-limit]), .clk1(clk1));
    integer i,j;

    always @(*) begin  
        for ( i=0; i<limit; i=i+1) begin
            for ( j=0; j<limit; j=j+1 ) begin
                Pathreg[ limit*i+j ] = PathBuff[ limit+i] & PathBuff[j];
            end
        end       
    end

    assign path = Pathreg;
endmodule
