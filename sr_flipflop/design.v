module sr_flipflop(out,inv,s,r,clk);

input s,r,clk;
output reg out,inv;

always @ (posedge clk)
begin
  case({s,r})
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
           $display("state : indertermine !");
          end

  endcase
end

endmodule