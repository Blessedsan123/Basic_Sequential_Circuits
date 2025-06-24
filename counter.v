`timescale 1ns / 1ps

module counter(
input clk,
input rst,
output [3:0] ucount,
output [3:0] dcount
);

    jk f1(.clk(~clk),
          .rst(rst), 
          .j(1'b1), 
          .k(1'b1), 
          .q(ucount[0]),
          .qnot(dcount[0]));
    
    jk f2(.clk(~ucount[0]),
          .rst(rst), 
          .j(1'b1), 
          .k(1'b1), 
          .q(ucount[1]),
          .qnot(dcount[1]));
          
    jk f3(.clk(~ucount[1]),
          .rst(rst), 
          .j(1'b1), 
          .k(1'b1), 
          .q(ucount[2]),
          .qnot(dcount[2]));
          
    jk f4(.clk(~ucount[2]),
          .rst(rst), 
          .j(1'b1), 
          .k(1'b1), 
          .q(ucount[3]),
          .qnot(dcount[3]));
      
endmodule
