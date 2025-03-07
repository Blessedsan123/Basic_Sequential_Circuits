module seq_detector(out,in,clk,rst);
input in,clk,rst;
output reg out;

reg [2:0] present;
reg [2:0] next;

parameter [2:0] s0 = 3'b000;
parameter [2:0] s1 = 3'b001;
parameter [2:0] s2 = 3'b010;
parameter [2:0] s3 = 3'b011;
parameter [2:0] s4 = 3'b100;

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
      out <= 1'b0;
      if(in)
      begin
        next = s4;
      end
      else
      begin
        next = s0;
      end
    end

    s4 : begin
      out <= 1'b1;
      if(in)
      begin
        next = s0;
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