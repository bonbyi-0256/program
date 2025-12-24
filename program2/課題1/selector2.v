module selector2(s,a,x);
  input s;
  input [0:1]a;
  output x;

  assign x = (a[0] & ~s)|(a[1] & s);

endmodule