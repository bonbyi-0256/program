module inc(x,s);
  parameter N=8;
  input[N-1:0] x;
  output[N:0] s;

  assign s=x+1;

endmodule