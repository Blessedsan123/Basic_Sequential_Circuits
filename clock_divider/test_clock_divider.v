// Code your testbench here
// or browse Examples
module test;
  reg clk,rst;
  wire r_clk;
  
  clock_divider cd (clk,rst,r_clk);
  
  always #5 clk = ~clk;
  
  initial
    begin
      $dumpfile("wave.vcd");
      $dumpvars(0,test);
      $monitor("clk = %b , rst = %b , counter = %d  ==> r_clk = %b",clk,rst,cd.counter,r_clk);
      clk = 0;
      rst = 1;
      #10;
      rst = 0;
      #500 $finish;
    end
endmodule
