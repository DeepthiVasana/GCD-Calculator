`timescale 1ns / 1ps
module data_1(gt,lt,eq,lda,ldb,sel1,sel2,selin,data_in,clk);
output gt,lt,eq;
input lda,ldb,sel1,sel2,selin;
input [15:0] data_in;
input clk;
wire x,y;
wire [15:0] aout,bout,subout,X,Y,bus;
PIPO u1(aout,bus,lda,clk);
PIPO u2(bout,bus,ldb,clk);
MUX mux_in1(X,aout,bout,sel1);
MUX mux_in2(X,aout,bout,sel2);
MUX mux_load(bus,subout,data_in,selin);
SUB u3(subout,x,y);
COMP u4(lt,gt,eq,aout,bout);
endmodule
module PIPO(aout,data_in,lda,clk);
output reg [15:0]aout;
input lda,clk;
input [15:0] data_in;
always @(posedge clk) begin
if(lda)
aout <= data_in;
end
endmodule
module MUX(out,in0,in1,sel);
input [15:0] in0,in1;
input sel;
output [15:0] out;
assign out = sel?in0:in1;
endmodule
module SUB(subout,x,y);
output subout;
input x,y;
assign subout = x-y;
endmodule 
module COMP(lt,gt,eq,aout,bout);
output reg lt,gt,eq;
input aout,bout;
//integer aout,bout;
always @(*) begin
if(aout<bout)
     lt=1;
else if(aout>bout)
     gt=1;
else
     eq=1;
end
endmodule        