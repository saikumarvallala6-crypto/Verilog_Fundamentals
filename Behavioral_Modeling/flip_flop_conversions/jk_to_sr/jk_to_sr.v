module sr_jk(input s,r,clk,rst,output reg q,qb);
reg j,k;
always@(*)begin
j=s;
k=r;
end
always@(posedge clk)
begin
	if(rst)begin
		{q,qb}<=2'b01;
		end
	else
	if({~j&&~k})
	begin q<=q;qb<=qb;end
	else if({~j&&k})
	begin q<=0;qb<=1;end
	else if({j&&~k})
	begin q<=1;qb<=0;end
	else
	begin q<=~q;qb<=~qb;end
end
endmodule

module sr_tb;
reg s,r,clk,rst;
wire q,qb;
sr_jk dut(s,r,clk,rst,q,qb);
initial clk=0;
always #5 clk=~clk;
integer i,jv;
initial begin
	$monitor("time=%0t s=%b r=%b clk=%b rst=%b q=%b qb=%b",$time,s,r,clk,rst,q,qb);
	rst=1;#10;
	rst=0;
	for(i=0;i<=1;i=i+1)
		for(jv=0;jv<=1;jv=jv+1)
			begin
			s=i;
			r=jv;
			#10;
			end
			#10 $finish;
	end
endmodule


		
