`define FETCH 2'b01

module fetch(clk,rst_n,run,halt,cs,pcout,irout,ramout);

  input clk,rst_n,run,halt;
  output[11:0] pcout;
  output[15:0] irout,ramout;
  output[1:0] cs;
  reg haltf;

  always @(posedge clk or negedge rst_n)
    if(!rst_n)
      haltf<=1'b0;
    else if(ramout == 16'hFFFF)
      haltf<=1'b1;
  counter #(12) pc0(.clk(clk),.rst_n(rst_n),.load(1'b0),.inc(cs==`FETCH),.q(pcout));
  counter #(16) ir0(.clk(clk),.rst_n(rst_n),.load(cs==`FETCH),.inc(1'b0),.d(ramout),.q(irout));
  state state0(.clk(clk),.rst_n(rst_n),.run(run&~haltf),.halt(1'b1),.q(cs));
  ram ram0(.clk(clk),.load(1'b0),.addr(pcout),.q(ramout));

endmodule