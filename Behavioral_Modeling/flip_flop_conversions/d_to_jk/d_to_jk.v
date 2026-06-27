module jk_d(input j,k,clk,rst,output reg q,qb);
reg d;
always@(*)begin
	d=(j&qb)|(~k&q);
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

module jk_tb;
reg j,k,clk,rst;
wire q,qb;
jk_d dut(j,k,clk,rst,q,qb);
initial clk=0;
always #5 clk=~clk;
integer m,n;
initial begin 
	$monitor("time=%0t j=%b k=%b clk=%b rst=%b q=%b qb=%b",$time,j,k,clk,rst,q,qb);
	rst=1;#10;
	rst=0;
	for(m=0;m<=1;m=m+1)begin
		for(n=0;n<=1;n=n+1)begin
			j=m;
			k=n;
			#10;
			end
			end
	
/*	for(i=0;i<=1;i=i+1)begin
		for(j=0;j<=1;j=j+1)begin
			s=i;
			r=j;
			#10;
		end
		end*/
		#10 $finish;
	end
endmodule

