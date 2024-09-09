module jk_flipflop(out,inv,j,k,clk);

input j,k,clk;
output reg out,inv;

always @ (posedge clk)
begin
  case({j,k})
  2'b00 : begin
          $display("state : nochanage");
          out <= 1'bx;
          #5;
          inv <= ~ out;
          end
  2'b01 : begin
           $display("state : reset");
           out <= 1'b0;
           #5;
           inv <= ~out;
          end
  2'b10 : begin
          $display("state : set");
           out <= 1'b1;
           #5;
           inv <= ~out;
          end
  2'b11 : begin
           $display("state : toogle");
           out <= ~1'bx; // 0 or 1
           #5;
           inv <= ~out;
          end

  endcase
end

endmodule