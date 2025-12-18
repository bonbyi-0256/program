module incall(x,s);
  parameter N=8;
  input[N-1:0] x;
  output[N:0] s;
  reg[N:0] s;

  always @(x)s=x+1;

endmodule