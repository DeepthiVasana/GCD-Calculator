`timescale 1ns / 1ps
module DC_tb();
reg [15:0] data_in;
reg clk , start;
wire done;
reg [15:0] A,B;
data_1 uut(gt,lt,eq,lda,ldb,sel1,sel2,selin,data_in,clk);
Control_Path CON(lda,ldb,sel1,sel2,selin,lt,gt,eq,clk,start,done);
initial begin
clk = 1'b0;
#3 start = 1'b1;
#1000 $finish;
end
always #5 clk = ~clk;
initial begin
#12 data_in = 143;
#10 data_in = 78;
$monitor(" gcd = %d",uut.aout);
end
endmodule
