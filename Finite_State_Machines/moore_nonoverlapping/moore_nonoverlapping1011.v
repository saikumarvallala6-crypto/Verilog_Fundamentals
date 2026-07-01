module moorenonover_1011(input x,clk,rst,output reg y);
reg [2:0] cs,ns;
parameter 	s0=3'b000,
			s1=3'b001,
			s2=3'b010,
			s3=3'b011,
			s4=3'b100;
always@(posedge clk)begin
	if(rst)begin
		cs<=s0;end
	else
		cs<=ns;
	end
	always@(*)begin
		//y=0;
		case(cs)
		s0:begin
			if(x)ns<=s1;
			else ns<=s0;end
		s1:begin
			if(x)ns<=s1;
			else ns<=s2;end
		s2:begin
			if(x)ns<=s3;
			else ns<=s0;end
		s3:begin
			if(x)ns<=s4;
			else ns<=s2;end
		s4:begin
			if(x) ns<=s1;
			else ns<=s0;end
		endcase
		end
always@(*)begin
case(cs)
s4: y=1;
default: y=0;
endcase
end
	endmodule

module moore_tb;
reg x,clk,rst;
wire y;
moorenonover_1011 dut(x,clk,rst,y);
integer count=0;
initial clk=0;
always #5 clk=~clk;
initial begin
$monitor("x=%b clk=%b rst=%b y=%b count=%d",x,clk,rst,y,count);
rst=1;#10;
rst=0;
x=1;#10;
x=0;#10;
x=1;#10;
x=1;#10;
x=0;#10;
x=1;#10;
x=1;#10;
x=1;#10;
x=0;#10;
x=1;#10;
x=1;#10;
$finish;
end
always@(posedge y)begin
count<=count+1;
end
endmodule
