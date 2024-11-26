//Create 8 D flip-flops with active high asynchronous reset. 
//All DFFs should be triggered by the positive edge of clk. 

module diff8ar (
    input clk,
    input areset,   // active high asynchronous reset
    input [7:0] d,
    output [7:0] q
);
    reg [7:0] q1;
    always @(posedge clk or posedge areset) begin
        if ( areset == 1'b1 ) begin
            q1<=8'h00;
        end
        else begin
            q1<=d;
        end
    end

    assign q=q1;
endmodule
