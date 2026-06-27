module mod4_counter(input clk,rst,enb,output reg [1:0]count);
always@(posedge clk)begin
	if(rst)begin
		count<=2'b00;end
	else if(enb)begin
		count<=count+1;
		end
	else
		count<=count;
	end
endmodule

module mod_tb;
reg clk,rst,enb;
wire [1:0]count;
mod4_counter dut(clk,rst,enb,count);
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
