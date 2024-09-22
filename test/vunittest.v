
`include "vunit_defines.svh"

module ComplimentCode_tb;

  // Parameters
  localparam  bitNumber = 0;

  //Ports
  reg [bitNumber-1:0] A;
  reg [bitNumber-1:0] B;
  wire [bitNumber-1:0] Aout;
  wire [bitNumber-1:0] Bout;
  reg  clk1;

  ComplimentCode # (
    .bitNumber(bitNumber)
  )
  ComplimentCode_inst (
    .A(A),
    .B(B),
    .Aout(Aout),
    .Bout(Bout),
    .clk1(clk1)
  );

  `TEST_SUITE begin
    // It is possible to create a basic test bench without any test cases
    $display("Hello world");
  end

//always #5  clk = ! clk ;

endmodule