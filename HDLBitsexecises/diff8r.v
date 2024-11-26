//Create 8 D flip-flops with active high synchronous reset. All DFFs should be triggered by the positive edge of clk. 
module diff8r (
    input clk,
    input reset,            // Synchronous reset
    input [7:0] d,
    output [7:0] q
);

    reg [7:0] q1;
    always @( posedge clk) begin
        if ( reset == 1'b1) begin
            q1<=8'b0;
        end
        else begin
            q1<=d;
        end
    end

    assign q=q1;
endmodule
