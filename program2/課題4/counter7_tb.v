module counter7_tb;

  reg clk,rst_n,x;
  wire y;

  counter7 counter7_0(clk,rst_n,x,y);

  initial clk=0;
  always #50 clk=~clk;

  initial begin
  $dumpvars;
  rst_n=0;x=0;#100
  rst_n=1;x=0;#600
  x=1;#800
  $finish;
  end

endmodule