module arb_counter(input clk,rst,enb,output reg [2:0]count);
reg [2:0]seq[0:3];
reg [1:0]index;
initial begin
seq[0]=3'b000;
seq[1]=3'b011;
seq[2]=3'b111;
seq[3]=3'b010;
end
always@(posedge clk)begin
	if(rst)begin
		index<=0;
		count<=seq[0];
		end
	else if(enb)begin
			index<=(index==3)?0:index+1;
			count<=seq[index];
		end
	else 
		count<=count;
	end
endmodule

module arb_tb;
reg clk,rst,enb;
wire [2:0]count;
arb_counter dut(clk,rst,enb,count);
initial clk=0;
always #5 clk=~clk;
initial begin
$monitor("clk=%b rst=%b enb=%b count=%b",clk,rst,enb,count);
rst=1;enb=0;#10;
rst=0;enb=0;#10;
enb=1;#10;
#50
$finish;
end
endmodule
