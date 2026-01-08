module stack6(clk, load, push,pop,d,qtop,qnext);
  input clk,load,push,pop;
  input [15:0] d;
  output[15:0] qtop,qnext;
  reg[15:0] q[0:5];

  assign qtop=q[0];
  assign qnext=q[1];

always @(posedge clk)
  begin
    if(load) q[0]<=d; else if(pop) q[0]<=q[1];
    if(push) q[1]<=q[0]; else if(pop) q[1]<=q[2];
    if(push) q[2]<=q[1]; else if(pop) q[2]<=q[3];
    if(push) q[3]<=q[2]; else if(pop) q[3]<=q[4];
    if(push) q[4]<=q[3]; else if(pop) q[4]<=q[5];
    if(push) q[5]<=q[4]; else if(pop) q[5]<=16'hxxxx;
  end

endmodule