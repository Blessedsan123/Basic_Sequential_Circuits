// Code your design here
module clock_divider(
  input clk,
  input rst,
  output reg r_clk
);
  
  /* required 1Mhz frequency
  counter  = (system clk / required clk) / 2
  
  = (1*10^9 / 1*10^6)/2
  
  = 1000/2 = 500 (+ve , -ve)  */
  
  reg [3:0] counter;
  
  always @ (posedge clk)
    begin
      if(rst)
        begin
          r_clk <= 0;
          counter <= 0;
        end
      else
        begin
          if(counter == 10)
            begin
              r_clk <= ~r_clk;
              counter <= 0;
            end
          else
            counter = counter +1;
        end
      end
endmodule
  
    
  
