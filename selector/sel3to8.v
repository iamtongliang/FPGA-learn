//`timescale 10ns/1ns
/*
Path    Sel
0       000
1       001
2       010
3       011
4       100
5       101
6       110
7       111
*/
`include "sel2to4.v"

module sel3to8 (
    input [2:0] select,
    output [7:0] path,
    input clk1
);
    parameter limit = 3;
    reg [limit-1:0] Selreg;
    reg [7:0] Pathreg;

    wire [7:0] PathBuff;
	 always @ (*) begin
		  Selreg = select;
	 end
		  sel2to4 se1(.select(Selreg[1:0]), .path(PathBuff[3:0]), .clk1(clk1));

    integer i,j;

    always @(*) begin  
        for ( j=0; j<4; j=j+1 ) begin
            Pathreg[ j ] = PathBuff[j] &(~Selreg[2]);
            end
        j = 0;
        for ( i=4; i<8; i=i+1) begin
            Pathreg[ i ] = PathBuff[j] & (Selreg[2]);
            j = j+1;
        end
    end

    assign path = Pathreg;
endmodule
