module counter7(clk,rst_n,x,y);
  input clk,rst_n,x;
  output y;
  reg [2:0] q;
  reg y;

  always @(posedge clk,negedge rst_n)
  if(!rst_n)q<=0;
  else if(x==0)q<=(q+1)%7;
  else q<=(q+6)%7;

  always @ (q)
  if(q<=2)y=0;
  else y=1;

endmodule