
module ComplimentCode #(
    parameter bitNumber = 8
)(
    input [bitNumber-1:0] A,
    input [bitNumber-1:0] B,
    output [bitNumber-1:0] Aout,
    output [bitNumber-1:0] Bout,
    input clk1
);
    reg [bitNumber-1:0] Ainbuf,Binbuf;
    reg [bitNumber-1:0] Aoutbuf, Boutbuf;
    integer i;
    reg [7:0] Cinbuf;
    reg newdata;

    initial begin
        Ainbuf = 0;
        Binbuf = 0;
        Aoutbuf = 0;
        Boutbuf = 0;
        Cinbuf = 0;
        newdata = 1'b0;
    end
    
    always @(A,B) begin
        newdata = 1'b1;
        Ainbuf = A;
        Binbuf = B;
        Aoutbuf[bitNumber-1] = Ainbuf[bitNumber-1];
        Boutbuf[bitNumber-1] = Binbuf[bitNumber-1];
        Cinbuf[0] = Ainbuf[bitNumber-1]^1'b0;
        Cinbuf[1] = Binbuf[bitNumber-1]^1'b0;

        for ( i = 0 ; i<bitNumber-1 ;i=i+1 ) begin
            Aoutbuf[i] = (Ainbuf[i] ^ Cinbuf[0]);
            Boutbuf[i] = (Binbuf[i] ^ Cinbuf[1]);
        end
        Cinbuf[0] = 1'b0;
        Cinbuf[1] = 1'b0;        
        for ( i = 0 ; i<bitNumber-1 ;i=i+1 ) begin
            Aoutbuf[i] = (Aoutbuf[i] ^ Aoutbuf[bitNumber-1])^Cinbuf[0];
            Boutbuf[i] = (Boutbuf[i] ^ Boutbuf[bitNumber-1])^Cinbuf[1];
            Cinbuf[0] = (Aoutbuf[i] & Aoutbuf[bitNumber-1])|Cinbuf[0]&(Aoutbuf[i] ^ Aoutbuf[bitNumber-1]);
            Cinbuf[1] = (Boutbuf[i] & Boutbuf[bitNumber-1])|Cinbuf[1]&(Boutbuf[i] ^ Boutbuf[bitNumber-1]);
        end

    end
    assign Aout = Aoutbuf&{bitNumber{newdata}};
    assign Bout = Boutbuf&{bitNumber{newdata}};

    always @(negedge clk1) begin
        #1 newdata = 1'b0;
    end

    assign Aout = Aoutbuf&{bitNumber{newdata}};
    assign Bout = Boutbuf&{bitNumber{newdata}};

endmodule