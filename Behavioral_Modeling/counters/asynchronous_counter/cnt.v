module tff(input t,clk,rst,output reg q);
always@(posedge clk)begin
	if(rst)begin
		q<=1'b0;
		end
	else begin
		case(t) 
			1'b0: q<=q;
			1'b1: q<=~q;
		endcase
		end
		end
endmodule

module asyn_counter(input clk,rst,output [3:0]count);

tff t1(1'b1,clk,rst,count[0]);
tff t2(1'b1,count[0],rst,count[1]);
tff t3(1'b1,count[1],rst,count[2]);
tff t4(1'b1,count[2],rst,count[3]);
endmodule

module counter_tb;
reg clk,rst;
wire [3:0]count;
asyn_counter dut(.*);
initial clk=0;
always #5 clk=~clk;
initial begin
	$monitor("clk=%b rst=%b count=%d",clk,rst,count);
	rst=1;#10;
	rst=0;#10;
	#100;
	$finish;
	end
endmodule



