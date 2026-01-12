module ram_tb;

  reg clk,load;
  reg[11:0] addr;
  reg[15:0] d;
  wire[15:0] q;

  ram ram0(clk,load,addr,d,q);

  initial clk=0;
  always #50 clk=~clk;

  initial begin
    $dumpvars;
    load=1;addr=75;d=14;#100
    load=1;addr=14;d=24;#100
    load=1;addr=24;d=75;#100
    load=0;addr=75;#100
    addr=14;#100
    addr=24;#100
    $finish;
  end
endmodule