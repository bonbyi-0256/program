module combi(a,b,c,d,x,y);

  input a,b,c,d;
  reg e,f,g,h,i,j,k,l,m,n;
  output x,y;
  reg x,y;

  always @ (a,b,c,d,e,f,g,h,i,j,k,l,m,n)
    begin
    e=a&b;
    f=c&d;
    g=a&~d;
    h=~b&c;
    i=b&~c&~d;
    j=~a&~b&d;
    k=a|b|c|d;
    l=a|~b|c|~d;
    m=a|~b|~c|d;
    n=~a|b|c|~d;
    x=e|f|g|h|i|j;
    y=k&l&m&n;
  end

endmodule