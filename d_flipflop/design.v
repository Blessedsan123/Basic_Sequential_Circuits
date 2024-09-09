module d_flipflop(out,inv,in,clk);

input in,clk;
output reg out,inv;

always @ (posedge clk)
begin
  out <= in;
  #5;
  inv <= ~out;
end

endmodule