`include "design.v"

module test();
reg j,k,clk;
wire out,inv;

jk_flipflop s1(out,inv,j,k,clk);

initial
begin
  j = 1'b1;
  k = 1'b1;
  clk = 1'b1;
  #5;
  $display("output is : %d",out);
  
  #5;
  $display("invert is : %d",inv);

end

endmodule