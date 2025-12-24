module counter7(clk,rst_n,x,y);
  input clk,rst_n,x;
  output y;
  reg [2:0] q;
  wire y;

  always @(posedge clk,negedge rst_n)
  if(!rst_n)q<=0;
  else case({x,q})
    4'b0000:q<=3'b001;//0->1
    4'b0001:q<=3'b010;//1->2
    4'b0010:q<=3'b011;//2->3
    4'b0011:q<=3'b100;//3->4
    4'b0100:q<=3'b101;//4->5
    4'b0101:q<=3'b110;//5->6
    4'b0110:q<=3'b000;//6->0
    4'b1000:q<=3'b110;//0->6
    4'b1001:q<=3'b000;//1->0
    4'b1010:q<=3'b001;//2->1
    4'b1011:q<=3'b010;//3->2
    4'b1100:q<=3'b011;//4->3
    4'b1101:q<=3'b100;//5->4
    4'b1110:q<=3'b101;//6->5
    default:q<=3'bxxx;
  endcase

  assign y=(q<=2?0:1);

endmodule