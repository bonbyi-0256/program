`define NEG 5'b10000
`define BNOT 5'b10001
`define NOT 5'b10010
`define ADD 5'b00000
`define SUB 5'b00001
`define MUL 5'b00010
`define SHL 5'b00011
`define SHR 5'b00100
`define BAND 5'b00101
`define BOR 5'b00110
`define BXOR 5'b00111
`define AND 5'b01000
`define OR 5'b01001
`define EQ 5'b01010
`define NE 5'b01011
`define GE 5'b01100
`define LE 5'b01101
`define GT 5'b01110
`define LT 5'b01111

module alu_tb;
  reg signed [15:0] a,b;
  reg [4:0] f;
  wire signed [15:0] s;

  alu alu0(.a(a),.b(b),.f(f),.s(s));

  initial begin
    $dumpvars;
    a = -3;b=1475;
    f=`NEG; #100;
    f=`BNOT; #100;
    f=`NOT; #100;
    f=`ADD; #100;
    f=`SUB; #100;
    f=`MUL; #100;
    f=`SHL; #100;
    f=`SHR; #100;
    f=`BAND; #100;
    f=`BOR; #100;
    f=`BXOR; #100;
    f=`AND; #100;
    f=`OR; #100;
    f=`EQ; #100;
    f=`NE; #100;
    f=`GE; #100;
    f=`LE; #100;
    f=`GT; #100;
    f=`LT; #100;
    $finish;
  end

endmodule