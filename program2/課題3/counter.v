module counter(clk,rst_n,load,inc,d,q,dec);
  parameter N=16;
  input clk,rst_n,load,inc,dec;
  input[N-1:0] d;
  output[N-1:0] q;
  reg[N-1:0] q;

  always @(posedge clk, negedge rst_n)
  if(!rst_n) q<=0;
  else if(load) q<=d;
  else if(inc) q<=q+1;
  else if(dec) q<=q-1;

endmodule