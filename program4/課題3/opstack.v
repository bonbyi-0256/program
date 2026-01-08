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

module opstack(clk,rst_n,num,op,x,qtop);
  input clk,rst_n,num,op;
  input[15:0] x;
  output[15:0] qtop;
  wire[15:0] qnext,aluout;
  wire load,push,pop;
  reg[15:0] stackin;

  alu alu0(.a(qtop),.b(qnext),.f(x[4:0]),.s(aluout));
  stack stack0(.clk(clk),.rst_n(rst_n),.load(load),.push(push),.pop(pop),.d(stackin),.qtop(qtop),.qnext(qnext));

  assign load = num|op;
  assign push = num;
  assign pop = op&~x[4];

  always @(num,op,x,aluout)
    if(num) stackin=x;
    else if(op) stackin =aluout;
    else stackin = 16'hxxxx;
endmodule