`include "design.v"
module test();

reg in,clk,rst;
wire out;

seq_detector s1 (out,in,clk,rst);

initial
begin
  
  $dumpfile("seqwave.vcd");
  $dumpvars(0,test);

  //initialization of values

  clk = 1;
  rst = 1;
  in = 1;
  #10;
  $display("output is : %d",out);
  #20;
  rst = 0;
  #10;
  in = 1;
  #10;
  $display("output is : %d",out);
  #10;
  in = 0;
  #10;
  $display("output is : %d",out);
  #10;
  in = 1;
  #10;
  $display("output is : %d",out);
  #10;
  in = 1;
  #10;
  $display("output is : %d",out);
  #10;
  in = 0;
  #10;
  $display("output is : %d",out);
  #10;
  in = 1;
  #10;
  $display("output is : %d",out);
  #10;
  in = 0;
  #10;
  $display("output is : %d",out);
  #10;
  in = 1;
  #10;
  $display("output is : %d",out);
  #10;
  in = 1;
  #10;
  $display("output is : %d",out);
  #10;
  in = 1;
  #10;
  $display("output is : %d",out);
  #10;

  $finish;
end

always #10 clk = ~clk;

endmodule