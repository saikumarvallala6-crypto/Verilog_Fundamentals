module d_t(input d,clk,rst,output reg q,qb);
reg t;
always@(*)begin
	t=d^q;
	end
always@(posedge clk)begin
	if(rst)begin 
		{q,qb}=2'b01;
		end
	else if(t)begin	q<=~q;qb<=~qb;end
	else begin q<=q;qb<=qb;end
	end
endmodule

module d_tb;
reg d,clk,rst;
wire q,qb;
d_t dut(d,clk,rst,q,qb);
initial clk=0;
always #5 clk=~clk;
initial begin
	$monitor("time=%0t d=%b clk=%b rst=%b q=%b qb=%b",$time,d,clk,rst,q,qb);
	rst=1;#10;
	rst=0;
	d=0;#10;
	d=1;#10;
	#10 $finish;
	end
endmodule
