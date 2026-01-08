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

module opstack_tb;
  reg clk,rst_n,num,op;
  reg[15:0] x;
  wire[15:0] qtop;
  opstack opstack0(clk,rst_n,num,op,x,qtop);
  
  initial clk=0;
  always #50 clk=~clk;

initial begin
  $dumpvars;
  rst_n=0;num=0;op=0;x=0;#100
  rst_n=1;num=1;op=0;x=1;#100
  num=1;op=0;x=2;#100;
  num=1;op=0;x=3;#100;
  num=0;op=1;x=`MUL;#100;
  num=0;op=1;x=`ADD;#100;
  num=1;op=0;x=4;#100;
  num=0;op=1;x=`SUB;#100;
  num=1;op=0;x=5;#100;
  num=0;op=1;x=`LT;#100;
  num=1;op=0;x=6;#100;
  num=0;op=1;x=`BXOR;#100;
  num=1;op=0;x=7;#100;
  num=0;op=1;x=`GT;#100;
  num=1;op=0;x=8;#100;
  num=0;op=1;x=`BAND;#100;
  num=1;op=0;x=9;#100;
  num=0;op=1;x=`BOR;#100;
  $finish;
  end
endmodule