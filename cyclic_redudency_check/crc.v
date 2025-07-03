// Code your design here
module transmitter (
  input clk,
  input rst,
  input [7:0] data_in,
  output reg [11:0] data_out,
  output reg [3:0] crc_out
);
  
  function [3:0] crc_calc( input [7:0] data);
    //divisor taking 5 bit resistor
    reg [4:0] crc;
    integer i;
    begin
    crc = 5'b00000;
      for(i = 7; i >= 0 ; i = i - 1)
      begin
        crc = crc<<1;
        if(data[i]^crc[4])
          crc = crc^5'b10101;
      end
    crc_calc = crc[3:0];
    end
  endfunction
  
  always @ (posedge clk)
    begin
      if(rst)
        begin
          data_out <= 12'b000000000000;
          crc_out <= 4'b0000;
        end
      else
        begin
          crc_out <= crc_calc(data_in);
          data_out <= {data_in,crc_calc(data_in)};
        end
    end
  
endmodule


module reciver(
  input clk,
  input rst,
  input [7:0] data_in,
  input [3:0] crc_in,
  output reg [3:0] crc_out,
  output reg data_recive_valid
);
  
  function [3:0] crc_calc(input [7:0] data);
    reg [4:0] crc;
    integer i;
    begin
      crc = 5'b00000;
      for(i = 7 ; i >= 0 ; i = i-1)
        begin
          crc = crc << 1;
          if(data[i]^crc[4])
            crc = crc ^ 5'b10101;
        end
      crc_calc = crc[3:0];
    end
  endfunction
  
  always @ (posedge clk)
    begin
      if(rst)
        begin
          crc_out <= 4'b0000;
        end
      else
        begin
          crc_out <= crc_calc(data_in);
        end
    end
  
  always @ (*)
    begin
      data_recive_valid = (crc_out == crc_in) ? 1:0;
    end
  
endmodule


module crc (
  input clk,
  input rst,
  input [7:0] data_in,
  output [11:0] data_out,
  output [3:0] crc_out,
  output data_recive_valid
);
  
  transmitter tr (.clk(clk),
                  .rst(rst),
                  .data_in(data_in),
                  .data_out(data_out),
                  .crc_out(crc_out)
                 );
  
  reciver rc (.clk(clk),
              .rst(rst),
              .data_in(data_out[11:4]),
              .crc_in(data_out[3:0]),
              .crc_out(crc_out),
              .data_recive_valid(data_recive_valid)
              );
  
endmodule
