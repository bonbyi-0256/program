module selector8(s,a,x);
  input [2:0] s;
  input [0:7] a;
  output x;
  wire [0:5] c;

  selector2 selector2_0 (.s(s[0]),.a(a[0:1]),.x(c[0]));
  selector2 selector2_1 (.s(s[0]),.a(a[2:3]),.x(c[1]));
  selector2 selector2_2 (.s(s[0]),.a(a[4:5]),.x(c[2]));
  selector2 selector2_3 (.s(s[0]),.a(a[6:7]),.x(c[3]));
  selector2 selector2_4 (.s(s[1]),.a(c[0:1]),.x(c[4]));
  selector2 selector2_5 (.s(s[1]),.a(c[2:3]),.x(c[5]));
  selector2 selector2_6 (.s(s[2]),.a(c[4:5]),.x(x));

endmodule