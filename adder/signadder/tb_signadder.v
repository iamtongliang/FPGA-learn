`include "/home/liang-tong/learn/lang/verilog/adder/signadder/signadder.v"
`timescale 100ps/1ps
`default_nettype none

module tb_signadder();
reg clk = 0;

localparam CLK_PERIOD = 10;
always #(CLK_PERIOD/2) clk=~clk;

initial begin
    $dumpfile("tb_signadder.vcd");
    $dumpvars(0, tb_signadder);
end

reg [7:0] ina=0, inb=0;
wire [7:0] outa, outb;
integer i,seed1, seed2;
initial begin
        seed1 =10;
        seed2 =20;
        for ( i=0;i<=12;i=i+1) begin
            seed1=seed1+i;
            seed2=seed2+i;
            if ( i%3 == 0 ) begin
                #CLK_PERIOD ina = {$random(seed1)}%127;
                inb = ({$random(seed2)}%127)&8'h7f|8'h80;                
            end
            else if ( i%3 == 1 ) begin
                #CLK_PERIOD ina = {$random(seed1)}%127;
                inb = {$random(seed2)}%127;                
            end 
            else begin
                #CLK_PERIOD ina = ({$random(seed1)}%127)&8'h7f|8'h80;
                inb = ({$random(seed2)}%127)&8'h7f|8'h80;                
            end
         end
    
         seed1 =40;
         seed2 =60;
         for ( i=0;i<=12;i=i+1) begin
            seed1=seed1+i;
            seed2=seed2+i;
             if ( i%3 == 0 ) begin
                 #CLK_PERIOD ina = {$random(seed1)}%127;
                 inb = ({$random(seed2)}%127)&8'h7f|8'h80;                
             end
             else if ( i%3 == 1 ) begin
                 #CLK_PERIOD ina = {$random(seed1)}%127;
                 inb = {$random(seed2)}%127;                
             end 
             else begin
                 #CLK_PERIOD ina = ({$random(seed1)}%127)&8'h7f|8'h80;
                 inb = ({$random(seed2)}%127)&8'h7f|8'h80;                
             end
          end            
   
    #(CLK_PERIOD*4) $finish;            // Quit the simulation
end

    signadder #(.bitNUmber(8)) sa(.A(ina),.B(inb),.Carry(outa[0]),.Sum(outb),.clk1(clk));    


endmodule
`default_nettype wire 
    
