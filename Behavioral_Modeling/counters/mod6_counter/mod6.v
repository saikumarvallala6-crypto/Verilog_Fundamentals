module mod6(input clk,rst,enb,output reg [2:0]count);
always@(posedge clk)begin
	if(rst)begin
		count<=3'b000;
	end
	else if(enb)begin
		//	count<=(count>4)?3'b000:count+1;
		count<=(count<5)?count+1:3'b000;
		end
		else
			count<=count;
		end
endmodule

module mod6_tb;
reg clk,rst,enb;
wire [2:0]count;
mod6 dut(clk,rst,enb,count);
initial clk=0;
always #5 clk=~clk;
initial begin
$monitor("clk=%b rst=%b enb=%b count=%b",clk,rst,enb,count);
rst=1;enb=0;#10;
rst=0;enb=0;#10;
enb=1;#10;
#100;
$finish;
end
endmodule
	
