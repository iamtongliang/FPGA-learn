//`timescale 10ns/1ns

module ComplimentCode #(
    parameter bitNumber = 8
)(
    input [bitNumber-1:0] A, // 输入A
    input [bitNumber-1:0] B, // 输入B
    output [bitNumber-1:0] Aout, // 输出A的补码
    output [bitNumber-1:0] Bout, // 输出B的补码
    input clk1 // 时钟信号
);
    reg [bitNumber-1:0] Ainbuf,Binbuf; // 缓存输入A和B
    reg [bitNumber-1:0] Aoutbuf, Boutbuf; // 缓存输出A和B的补码
    integer i; // 循环变量
    reg [1:0] Cinbuf; // 进位缓存

    // 计算补码
    always @(*) begin
        Ainbuf = A; // 将输入A存储到缓存中
        Binbuf = B; // 将输入B存储到缓存中
        Aoutbuf[bitNumber-1] = Ainbuf[bitNumber-1]; // 将输入A的最高位存储到输出A的补码的最高位中
        Boutbuf[bitNumber-1] = Binbuf[bitNumber-1]; // 将输入B的最高位存储到输出B的补码的最高位中
        Cinbuf[0] = Ainbuf[bitNumber-1]^1'b0; // 计算输入A的补码的进位
        Cinbuf[1] = Binbuf[bitNumber-1]^1'b0; // 计算输入B的补码的进位

        // 计算输入A和B的补码
        for ( i = 0 ; i<bitNumber-1 ;i=i+1 ) begin
            Aoutbuf[i] = (Ainbuf[i] ^ Cinbuf[0]);
            Boutbuf[i] = (Binbuf[i] ^ Cinbuf[1]);
        end
        Cinbuf[0] = 1'b0; // 重置进位缓存
        Cinbuf[1] = 1'b0; // 重置进位缓存

        // 计算输入A和B的补码的进位
        for ( i = 0 ; i<bitNumber-1 ;i=i+1 ) begin
            Aoutbuf[i] = (Aoutbuf[i] ^ Aoutbuf[bitNumber-1])^Cinbuf[0];
            Boutbuf[i] = (Boutbuf[i] ^ Boutbuf[bitNumber-1])^Cinbuf[1];
            Cinbuf[0] = (Aoutbuf[i] & Aoutbuf[bitNumber-1])|Cinbuf[0]&(Aoutbuf[i] ^ Aoutbuf[bitNumber-1]);
            Cinbuf[1] = (Boutbuf[i] & Boutbuf[bitNumber-1])|Cinbuf[1]&(Boutbuf[i] ^ Boutbuf[bitNumber-1]);
        end

    end
    assign Aout = Aoutbuf; // 将输出A的补码赋值给输出端口
    assign Bout = Boutbuf; // 将输出B的补码赋值给输出端口
endmodule
