`include "design.v"

module test();
reg in,clk;
wire out,inv;

d_flipflop d1(out,inv,in,clk);

initial
begin
in = 1'b0;
clk = 1'b1;
#10;

$display("output is : %d",out);
#5;
$display("invert is : %d",inv);
end

endmodule