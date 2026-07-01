module pipo #(parameter N=4)(input [N-1:0]din,input clk,rst,output reg [N-1:0]dout);
//reg [N-1:0]buf_reg;
always@(posedge clk)begin
	if(rst)begin
	//	buf_reg<={N{1'b0}};
		dout<={N{1'b0}};
		end
	else begin
	//	buf_reg<=din;
		dout<=din;
	end
	end
endmodule

module pipo_tb;
parameter N=4;
reg [N-1:0]din;
reg clk,rst;
wire [N-1:0]dout;
pipo #(4) dut(din,clk,rst,dout);
initial clk=0;
always #5 clk=~clk;
initial begin
	$monitor("time=%0t din=%b clk=%b rst=%b dout=%b",$time,din,clk,rst,dout);
	rst=1;#10;
	rst=0;
	din<=12;#10;
	din<=14;#10;
	din<=9;#10;
	$finish;
	end
endmodule
