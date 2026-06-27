module t_d(input t,clk,rst,output reg q,qb);
reg d;
always@(*)begin
	d=t^q;
	end
always@(posedge clk)begin
	if(rst)begin 
		{q,qb}=2'b01;
		end
	else begin
		q<=d;qb<=~d;
		end
	end
endmodule

module t_tb;
reg t,clk,rst;
wire q,qb;
t_d dut(t,clk,rst,q,qb);
initial clk=0;
always #5 clk=~clk;
initial begin
	$monitor("time=%0t t=%b clk=%b rst=%b q=%b qb=%b",$time,t,clk,rst,q,qb);
	rst=1;#10;
	rst=0;
	t=0;#10;
	t=1;#10;
	#10 $finish;
	end
endmodule
