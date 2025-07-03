module test;
  reg clk,rst;
  reg [7:0] data_in;
  wire [11:0] data_out;
  wire [3:0] crc_out;
  wire data_valid;
  
  crc dut(clk,rst,data_in,data_out,crc_out,data_valid);
  
  always #5 clk = ~clk;
  
  initial
    begin
      $dumpfile("wave.vcd");
      $dumpvars(0,test);
      $monitor(" clk = %b , rst = %b , data_in = %b  ====> data_out = %b , crc_in = %b , crc_out = %b , data_valid%b",clk,rst,data_in,data_out,dut.data_out[3:0],crc_out,data_valid);
      clk = 0 ; 
      rst = 1;
      data_in = 8'b01010101;
      #10;
      rst = 0; 
      data_in = 8'b10101010;
      #10 data_in = 8'b00001111;
      #20 $finish;
    end
endmodule 
