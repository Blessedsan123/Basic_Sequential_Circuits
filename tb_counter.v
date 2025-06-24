`timescale 1ns / 1ps

module tb_counter;
reg clk,rst;
wire [3:0] ucount;
wire [3:0] dcount;

counter dut (clk,rst,ucount,dcount);

always #5 clk = ~ clk;

initial
begin
$monitor("time = %0t , clk = %b , rst = %b --> ucount = %d  , dcount = %b",$time,clk,rst,ucount,dcount);
clk = 0;
rst = 1;
#10;
rst = 0;
#500 $finish;
end
endmodule
