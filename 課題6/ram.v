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
      mem[12'h000]=16'h1003;
      mem[12'h001]=16'h1004;
      mem[12'h002]=16'hF001;
      mem[12'h003]=16'h1001;
      mem[12'h004]=16'hF002;
      mem[12'h005]=16'hF015;
      mem[12'h006]=16'h2009;
      mem[12'h007]=16'h300A;
      mem[12'h008]=16'hE000;
      mem[12'h009]=16'h0000;
      mem[12'h00A]=16'h0004;
    end

endmodule