module sr_t(input s,r,clk,rst,output reg q,qb);
reg t;
always@(*)begin
	t=(s&qb)|(~r&q);
	end
always@(posedge clk)begin
	if(rst)begin
		{q,qb}<=2'b01;
		end
	else if(t) 
		begin q<=~q;qb<=~qb;end
	else begin q<=q;qb<=qb;end
	end
endmodule

module sr_tb;
reg s,r,clk,rst;
wire q,qb;
sr_t dut(s,r,clk,rst,q,qb);
initial clk=0;
always #5 clk=~clk;
integer i,j;
initial begin 
	$monitor("time=%0t s=%b r=%b clk=%b rst=%b q=%b qb=%b",$time,s,r,clk,rst,q,qb);
	rst=1;#10;
/*	for(i=0;i<=1;i=i+1)begin
		for(j=0;j<=1;j=j+1)begin
			s=i;
			r=j;
			#10;
			end
			end*/
	rst=0;
	for(i=0;i<=1;i=i+1)begin
		for(j=0;j<=1;j=j+1)begin
			s=i;
			r=j;
			#10;
		end
		end
		#10 $finish;
	end
endmodule

