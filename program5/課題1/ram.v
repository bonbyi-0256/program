module ram(clk,load,addr,d,q);

  input clk,load;
  input[11:0] addr;
  input[15:0] d;
  output[15:0] q;
  reg[15:0] mem [0:4095];

    always @(posedge clk)
      if(load) mem[addr]<=d;
    
    assign q= mem[addr];

    initial begin
      mem[0]=16'h1234;
      mem[1]=16'h5678;
      mem[2]=16'h9ABC;
      mem[3]=16'hFFFF;
      mem[4]=16'hDEF0;
    end

endmodule