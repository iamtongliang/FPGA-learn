
/*
edit to simulte as the HDLBits platform 

*/
`timescale 10ns/1ns
module top_module ();

// for create clk
	reg clk=0;
	always #1 clk = ~clk;  // Create clock with period=10
	initial `probe_start;   // Start the timing diagram

	`probe(clk);        // Probe signal "clk"
    reg [3:0] sel;
    reg [7:0] path;
    reg [15:0] path1;

    initial begin
        integer i;

        for ( i=0; i<16; i=i+1) begin
            #1 sel = i;
        end

        #1 $finish;
    end
    
    sel3to8 selpart( .select(sel), .path(path), .clk1(clk));

    `probe(sel);
    `probe(path);
    
    sel4to16 selpart1( .select(sel), .path(path1), .clk1(clk));
    `probe(path1);   
    
endmodule

`timescale 10ns/1ns
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

module sel3to8 (
    input [2:0] select,
    output [7:0] path,
    input clk1
);
    parameter limit = 3;
    reg [limit-1:0] Selreg;
    reg [7:0] Pathreg;

    wire [7:0] PathBuff;

    assign Selreg = select;
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

`timescale 10ns/1ns
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

module sel4to16 (
    input [3:0] select,
    output [15:0] path,
    input clk1
);
    parameter limit = 4;
    reg [limit-1:0] Selreg;
    reg [limit*4-1:0] Pathreg;

    reg [limit*2-1:0] PathBuff;

    assign Selreg = select;
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
/*
Path    Sel
0       00
1       01
2       10
3       11
*/

module sel2to4 (
    input [1:0] select,
    output [3:0] path,
    input clk1
);
    reg [1:0] Selreg;
    reg [3:0] Pathreg;

    assign Selreg = select;
    always @(*) begin
        Pathreg[0] = ~((Selreg[0]^Selreg[1]) | (Selreg[0]|0) | (Selreg[1]|0));
        Pathreg[1] = (Selreg[0]^Selreg[1]) & Selreg[0];
        Pathreg[2] = (Selreg[0]^Selreg[1]) & Selreg[1];
        Pathreg[3] = (~(Selreg[0]^Selreg[1])) & ((Selreg[1]|1'b0)) & ((Selreg[1]|1'b0));
    end

    assign path = Pathreg;

endmodule