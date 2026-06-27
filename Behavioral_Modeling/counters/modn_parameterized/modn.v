module modn #(parameter N=6,C=3)(input clk,rst,enb,output reg [C-1:0]count);
always@(posedge clk)begin
	if(rst)begin
		count<={C{1'b0}};
	end
	else if(enb)begin
		//	count<=(count>4)?3'b000:count+1;
		count<=(count<(N-1))?count+1:({C{1'B0}});
		end
		else
			count<=count;
		end
endmodule

module modn_tb;
parameter N=10,C=4;
reg clk,rst,enb;
wire [C-1:0]count;
modn #(N,C) dut(clk,rst,enb,count);
//defparam dut.N=9,dut.C=4;
initial clk=0;
always #5 clk=~clk;
initial begin
$monitor("time=%0t N=%0d C=%0d clk=%b rst=%b enb=%b count=%b",$time,N,C,clk,rst,enb,count);
rst=1;enb=0;#10;
rst=0;enb=0;#10;
enb=1;#10;
#200;
$finish;
end
endmodule
	
