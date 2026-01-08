module stack6_tb;
  reg clk,load,push,pop;
  reg [15:0] d;
  wire [15:0] qtop,qnext;

  stack6 stack60(clk, load,push,pop,d,qtop,qnext);

  initial clk=0;
  always #50 clk=~clk;
  
  initial begin
    $dumpvars;
    load=0;push=0;pop=0;d=0; #100
    load=1;d=16'h1111;#100
    push=1;d=16'h2222;#100
    push=1;d=16'h3333;#100
    push=1;d=16'h4444;#100
    push=1;d=16'h5555;#100
    push=1;d=16'h6666;#100
    pop=1;#500;
    $finish;
  end

endmodule
