module adder8_tb;

  reg [7:0]x,y;
  wire [8:0]s;

  adder8 adder8_0(x,y,s);

  initial begin
    $dumpvars;
    x=0;y=0;#100
    x=1;y=2;#100
    x=2;y=4;#100
    x=4;y=8;#100
    x=8;y=16;#100
    x=16;y=32;#100
    x=32;y=64;#100
    x=64;y=128;#100
    x=128;y=0;#100
    x=129;y=2;#100
    x=131;y=4;#100
    x=135;y=8;#100
    x=143;y=16;#100
    x=159;y=32;#100
    x=191;y=64;#100
    x=255;y=128;#100
    $finish;
  end

endmodule