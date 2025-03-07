module seq_detector(out,in,clk,rst);
input in,clk,rst;
output reg out;

reg [1:0] present;
reg [1:0] next;

parameter [1:0] s0 = 2'b00;
parameter [1:0] s1 = 2'b01;
parameter [1:0] s2 = 2'b10;
parameter [1:0] s3 = 2'b11;

always @ (posedge clk)
begin
  if(rst)
  begin
  out = 1'b0;
  present = s0;
  next = s0;
  end
  else
  begin
    present = next;

    case(present)

    s0 : begin
      out <= 1'b0;
      if(in)
      begin
        next = s1;
      end
      else
      begin
        next = s0;
      end
    end

    s1 : begin
      out <= 1'b0;
      if(in)
      begin
        next = s1;
      end
      else
      begin
        next = s2;
      end
    end

    s2 : begin
      out <= 1'b0;
      if(in)
      begin
        next = s3;
      end
      else
      begin
        next = s0;
      end
    end

    s3 : begin
      out <= 1'b1;
      if(in)
      begin
        next = s1;
      end
      else
      begin
        next = s0;
      end
    end
    
    endcase
  end
end

endmodule