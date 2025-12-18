module adder8(x,y,s);

  input [7:0]x,y;
  output [8:0]s;
  wire [7:0]c;

  fa fa0(.x(1'b0),.y(x[0]),.z(y[0]),.s(s[0]),.c(c[0]));
  fa fa1(.x(c[0]),.y(x[1]),.z(y[1]),.s(s[1]),.c(c[1]));
  fa fa2(.x(c[1]),.y(x[2]),.z(y[2]),.s(s[2]),.c(c[2]));
  fa fa3(.x(c[2]),.y(x[3]),.z(y[3]),.s(s[3]),.c(c[3]));
  fa fa4(.x(c[3]),.y(x[4]),.z(y[4]),.s(s[4]),.c(c[4]));
  fa fa5(.x(c[4]),.y(x[5]),.z(y[5]),.s(s[5]),.c(c[5]));
  fa fa6(.x(c[5]),.y(x[6]),.z(y[6]),.s(s[6]),.c(c[6]));
  fa fa7(.x(c[6]),.y(x[7]),.z(y[7]),.s(s[7]),.c(c[7]));

  assign s[8]=c[7];

endmodule