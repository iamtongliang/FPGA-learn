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
		
	 always @(*) begin	
		  Selreg = select;
    //always @(*) begin
        Pathreg[0] = ~((Selreg[0]^Selreg[1]) | (Selreg[0]|0) | (Selreg[1]|0));
        Pathreg[1] = (Selreg[0]^Selreg[1]) & Selreg[0];
        Pathreg[2] = (Selreg[0]^Selreg[1]) & Selreg[1];
        Pathreg[3] = (~(Selreg[0]^Selreg[1])) & ((Selreg[1]|1'b0)) & ((Selreg[1]|1'b0));
    end

    assign path = Pathreg;

endmodule