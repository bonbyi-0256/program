module operator;

  reg [7:0] x,y,z;

  initial begin
    x=-1;y=3;z=5;
    $display("x=%b(%d) y=%b(%d) z=%b(%d)",x,x,y,y,z,z);
    $display("x-y/z=%d (x-y)/z=%d",x-y/z,(x-y)/z);
    $display("~x=%b x&(-z)=%b x|(-z)=%b x^(-z)=%b",~x,x&(-z),x|(-z),x^(-z));
    $display("y>z=%b y==z=%b",y>z,y==z);
    $display("&x=%b |x=%b ^x=%b",&x,|x,^x);
    $display("x>z=%b !(x<z)=%b",x>z,!(x>z));
    $display("x<z&&y<z=%b x<z||y<z=%b",x<z&&y<z,x<z||y<z);
    $display("x<<z=%b x>>z=%b",x<<z,x>>z);
    $display("x<(-y)?x:y=%b(%d)",x<(-y)?x:y,x<(-y)?x:y);
    $display("{x,y,z}=%b",{x,y,z});
    $display("{2{x}}=%b",{2{x}});
  end

endmodule