module tinycpu_tb;
  reg clk,rst_n,run;
  wire [15:0] out;
  tinycpu tinycpu0(.clk(clk),.rst_n(rst_n),.run(run),.out(out));
  
  initial clk=0;
  always #50 clk=~clk;
  
  initial begin
    $dumpvars;
    rst_n=0;run=0;#100
    rst_n=1;run=1;#100
    run=0;#10000
    $finish;
    end
  endmodule 