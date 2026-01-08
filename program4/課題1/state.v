`define A 3'b000
`define B 3'b001
`define C 3'b010
`define D 3'b011
`define E 3'b100

module state(clk,rst_n,x,y,q);
  input clk,rst_n,x;
  output y;
  output[2:0] q;
  reg[2:0] q;
  assign y=(q==`E);
  always @(posedge clk,negedge rst_n)
  if(!rst_n)q<=`A;
  else
    case(q)
    `A:if(x) q<=`B;
    `B:if(x) q<=`C;
    `C:if(x) q<=`D;
    `D:if(x) q<=`E;
    `E:if(x) q<=`A;
    default: q <=3'bxxx;
  endcase

 endmodule