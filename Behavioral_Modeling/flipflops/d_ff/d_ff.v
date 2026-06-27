module dff(input d,clk,rst,output reg q,qb);
always@(posedge clk)begin
if(rst)begin
	{q,qb}=2'b01;
	end
else begin
	 q<=d;qb<=~d;
	 end
	 end
	endmodule

module dff_tb;
reg d,clk,rst;
wire q,qb;
dff uut(d,clk,rst,q,qb);
initial clk=0;
always #5 clk=~clk;
/*initial begin
clk=0;
forever #5 clk=~clk;
end*/
initial begin
	$monitor("time=%0t d=%b clk=%b rst=%b q=%b qb=%b",$time,d,clk,rst,q,qb);
	rst=1;
	d=0;#10;
	d=1;#10;
	rst=0;
	d=0;#10;
	d=1;#10;
	#5 $finish;
	end
endmodule

