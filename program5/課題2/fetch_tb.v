module fetch_tb;
  reg clk,rst_n,run,halt;
  wire[11:0] pcout;
  wire[15:0] irout,ramout;
  wire[1:0] cs;
  fetch fetch0(clk,rst_n,run,halt,cs,pcout,irout,ramout);

  initial clk=0;
  always #50 clk=~clk;

  initial begin
    $dumpvars;
    rst_n=0;run=0;halt=1;#100
    rst_n=1;run=1;#1200
    $finish;
  end
endmodule