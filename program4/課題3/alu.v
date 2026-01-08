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

module alu(a,b,f,s);
  input signed [15:0] a,b;
  input [4:0] f;
  output signed [15:0] s;
  reg signed [15:0] s;

  always @(a,b,f)
   case(f)
    `NEG: s=-a;
    `BNOT: s=~a;
    `NOT: s=!a;
    `ADD: s=b+a;
    `SUB: s=b-a;
    `MUL: s=b*a;
    `SHL: s=b<<a;
    `SHR: s=b>>a;
    `BAND: s=a&b;
    `BOR: s=a|b;
    `BXOR: s=b^a;
    `AND: s=b&&a;
    `OR: s=b||a;
    `EQ: s=b==a;
    `NE: s=b!=a;
    `GE: s=b>=a;
    `LE: s=b<=a;
    `GT: s=b>a;
    `LT: s=b<a;
    default:s=16'hxxxx;
  endcase
endmodule