`define FETCH 2'b01
`define EXEC 2'b10
`define HALT 4'b0000
`define PUSHI 4'b0001
`define PUSH 4'b0010
`define POP 4'b0011
`define JMP 4'b0100
`define JZ 4'b0101
`define JNZ 4'b0110
`define OUT 4'b1110
`define OP 4'b1111

module tinycpu(clk,rst_n,run,out);

  input clk,rst_n,run;
  output[15:0] out;
  wire[1:0] cs;
  wire[11:0] pcout;
  wire [15:0] dbus,irout,ramout,qtop,qnext,aluout;
  reg[11:0] abus;
  reg pcinc,abus2pc,dbus2ir,halt,dbus2stack,push,pop,dbus2ram;
  reg dbus2out,pc2abus,ir2abus,ram2dbus,ir2dbus,stack2dbus,alu2dbus;

  counter #(12)poc0(.clk(clk),.rst_n(rst_n),.load(abus2pc),.inc(pcinc),.d(abus),.q(pcout));
  counter #(16)ir0(.clk(clk),.rst_n(rst_n),.load(dbus2ir),.inc(1'b0),.d(dbus),.q(irout));
  state state0(.clk(clk),.rst_n(rst_n),.run(run),.halt(halt),.q(cs));
  stack stack0(.clk(clk),.rst_n(rst_n),.load(dbus2stack),.push(push),.pop(pop),.d(dbus),.qtop(qtop),.qnext(qnext));
  alu alu0(.a(qtop),.b(qnext),.f(irout[4:0]),.s(aluout));
  ram ram0(.clk(clk),.load(dbus2ram),.addr(abus),.d(dbus),.q(ramout));
  counter #(16)outbuf0(.clk(clk),.rst_n(rst_n),.load(dbus2out),.inc(1'b0),.d(dbus),.q(out));

  always @(pc2abus,ir2abus,pcout,irout)
    if(pc2abus)abus=pcout;
    else if(ir2abus)abus=irout[11:0];
    else abus=12'hxxx;
  assign dbus=ram2dbus?ramout:16'hzzzz;
  assign dbus=ir2dbus?{{4{irout[11]}},irout[11:0]}:16'hzzzz;
  assign dbus=stack2dbus?qtop:16'hzzzz;
  assign dbus=alu2dbus?aluout:16'hzzzz;
  always @(cs,irout,qtop)
    begin
      pcinc=0;abus2pc=0;dbus2ir=0;halt=0;dbus2stack=0;push=0;pop=0;dbus2ram=0;
      dbus2out=0;pc2abus=0;ir2abus=0;ram2dbus=0;ir2dbus=0;stack2dbus=0;alu2dbus=0;
    if(cs==`FETCH)
      begin
        pc2abus=1;ram2dbus=1;dbus2ir=1;pcinc=1;
      end
    else if(cs==`EXEC)
      case(irout[15:12])
      `HALT:halt=1;
      `PUSHI:begin ir2dbus=1;dbus2stack=1;push=1;end
      `PUSH:begin ir2abus=1;ram2dbus=1;dbus2stack=1;push=1;end
      `POP:begin ir2abus=1;stack2dbus=1;dbus2ram=1;pop=1;end
      `JMP:begin ir2abus=1;abus2pc=1;end
      `JZ:begin pop=1; if(qtop==0)begin ir2abus=1;abus2pc=1;end end
      `JNZ:begin pop=1;if(qtop!=0)begin ir2abus=1;abus2pc=1;end end
      `OUT:begin stack2dbus=1;dbus2out=1;pop=1;end
      `OP:begin alu2dbus=1;dbus2stack=1; if(irout[4]==0)pop=1; end
       endcase
     end
endmodule