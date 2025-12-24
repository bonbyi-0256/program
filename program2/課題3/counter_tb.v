module counter_tb;

  reg clk,rst_n,load,inc,dec;
  reg[7:0] d;
  wire[7:0] q;

  counter #(8) counter0 (clk,rst_n,load,inc,d,q,dec);

  initial clk=0;
  always #50 clk=~clk;

  initial begin
    $dumpvars;
    rst_n=0;load=0;inc=0;d=0;dec=0;#100
    rst_n=1;inc=1;#300
    inc=0;load=1;d=123;#100
    load=0;dec=1;#300
    load=1;d=254;#100
    inc=1;load=0;dec=0;#300
    rst_n=0;#100
    $finish;
  end
  
endmodule