`define FETCH 2'b01
`define EXEC 2'b10

module exfetch(clk,rst_n,run,halt);
  input clk,rst_n,run,halt;
  wire[1:0] cs;
  wire[11:0] pcout;
  wire[15:0] irout,ramout;
  reg[15:0] dbus;
  wire[11:0] abus;

  counter #(12) pc0(.clk(clk),.rst_n(rst_n),.load(1'b0),.inc(cs==`FETCH),.q(pcout));
  counter #(16) ir0(.clk(clk),.rst_n(rst_n),.load(cs==`FETCH),.inc(1'b0),.d(dbus),.q(irout));
  state state0(.clk(clk),.rst_n(rst_n),.run(run),.halt(halt),.q(cs));
  ram ram0(.clk(clk),.load(cs==`EXEC),.addr(abus),.d(dbus),.q(ramout));

  assign abus= (cs==`FETCH)?pcout: (cs==`EXEC)?{4'h0,irout[15:8]}:12'hxxx;

  always @(cs,ramout,irout)
    if(cs==`FETCH) dbus=ramout;
    else if(cs==`EXEC)dbus={8'h00,irout[7:0]};
    else dbus=16'hzzzz;

endmodule