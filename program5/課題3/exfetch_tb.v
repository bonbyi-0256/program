module exfetch_tb;
  reg clk,rst_n,run,halt;

  exfetch exfetch0(clk,rst_n,run,halt);

  initial clk=0;
    always #50 clk=~clk;

  initial begin
    $dumpvars;
    rst_n=0;run=0;halt=0;#100
    rst_n=1;run=1;#100
    run=0;#1000
    halt=1;#400
    $finish;
  end
  
endmodule