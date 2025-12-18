module combi_tb;
  reg a,b,c,d;
  wire x,y;
  combi combi0(a,b,c,d,x,y);

  initial begin
    $dumpvars;
    a=0;b=0;c=0;d=0;#100
    a=0;b=0;c=0;d=1;#100
    a=0;b=0;c=1;d=0;#100
    a=0;b=0;c=1;d=1;#100
    a=0;b=1;c=0;d=0;#100
    a=0;b=1;c=0;d=1;#100
    a=0;b=1;c=1;d=0;#100
    a=0;b=1;c=1;d=1;#100
    a=1;b=0;c=0;d=0;#100
    a=1;b=0;c=0;d=1;#100
    a=1;b=0;c=1;d=0;#100
    a=1;b=0;c=1;d=1;#100
    a=1;b=1;c=0;d=0;#100
    a=1;b=1;c=0;d=1;#100
    a=1;b=1;c=1;d=0;#100
    a=1;b=1;c=1;d=1;#100
    $finish;
  end

endmodule