module stack(clk, rst_n,load,push,pop,d,qtop,qnext);
  input clk, rst_n,load,push,pop;
  input[15:0] d;
  output[15:0] qtop,qnext;
  reg[15:0]q[0:3];
  
  assign qtop=q[0];
  assign qnext=q[1];
  
  always @(posedge clk or negedge rst_n)
    begin
     if(!rst_n)q[0]<=0;else if(load)q[0]<=d;else if(pop) q[0]<=q[1];
     if(!rst_n)q[1]<=0;else if(load)q[1]<=q[0];else if(pop) q[1]<=q[2];
     if(!rst_n)q[2]<=0;else if(load)q[2]<=q[1];else if(pop) q[2]<=q[3];
     if(!rst_n)q[3]<=0;else if(load)q[3]<=q[2];
  end

endmodule