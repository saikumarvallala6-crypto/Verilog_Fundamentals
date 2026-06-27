module mod_counter#(parameter WIDTH=4)(input t,clk,rst,enb,output reg [WIDTH-1:0]count);
always@(posedge clk)begin
	if(rst)begin
		count<={WIDTH{1'b0}};end
	else if(enb&&t==1)begin
		count<=count+1;
		end
	else
		count<=count;
	end
endmodule

module mod_tb;
parameter WIDTH=4;
reg t,clk,rst,enb;
wire [WIDTH-1:0]count;
mod_counter #(WIDTH) dut(t,clk,rst,enb,count);
initial clk=0;
always #5 clk=~clk;
initial begin
$monitor("time=%0t t=%b clk=%b rst=%b enb=%b count=%b",$time,t,clk,rst,enb,count);
t=1;rst=1;enb=0;#10;
rst=0;enb=0;#10;
enb=1;#10;
#100;
$finish;
end
endmodule
