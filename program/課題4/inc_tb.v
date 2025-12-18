module inc_tb;
  reg[5:0] x;
  wire[6:0] s;

  inc #(6) inc0(x,s);

  initial begin
    $dumpvars;
    x=0;#100
    x=1;#100
    x=2;#100
    x=3;#100
    x=5;#100
    x=7;#100
    x=11;#100
    x=17;#100
    x=23;#100
    x=37;#100
    x=41;#100
    $finish;
  end

endmodule