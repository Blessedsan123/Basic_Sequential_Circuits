`include "design.v"

module test();
reg s,r,clk;
wire out,inv;

sr_flipflop s1(out,inv,s,r,clk);

initial
begin
  s = 1'b1;
  r = 1'b0;
  clk = 1'b1;
  #5;
  $display("output is : %d",out);
  
  #5;
  $display("invert is : %d",inv);

end

endmodule