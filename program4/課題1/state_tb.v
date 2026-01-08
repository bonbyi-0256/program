module state_tb;
  reg clk,rst_n,x;
  wire y;
  wire[2:0] q;
  state state0(.clk(clk),.rst_n(rst_n),.x(x),.y(y),.q(q));

  initial clk=0;
  always #50 clk=~clk;
  
  initial begin
    $dumpvars;
    rst_n=0;x=0;#100
    rst_n=1;#100
    x=1;#100
    x=1;#100
    x=1;#100
    x=1;#100
    x=1;#100
    x=0;#100
    $finish;
  end
endmodule
