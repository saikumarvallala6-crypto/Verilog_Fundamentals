module jk_ff(input j,k,clk,rst,output reg q,qb);
always@(posedge clk)begin
if(rst)begin
	{q,qb}=2'b01;
	end
else begin
	case ({j,k})
	2'b00: begin
	q<=q;qb<=qb; end
	2'b01: begin
	q<=0;qb<=1;end
	2'b10 : begin
	q<=1;qb<=0;end
	2'b11 : begin
	q<=~q;qb<=q;end
	endcase
	end
	end
endmodule

module jk_tb;
reg j,k,clk,rst;
wire q,qb;
jk_ff dut(j,k,clk,rst,q,qb);
initial clk=0;
always #5 clk=~clk;
integer m,n;
initial begin 
	$monitor("time=%0t j=%b k=%b clk=%b rst=%b q=%b qb=%b",$time,j,k,clk,rst,q,qb);
	rst=1;
	for(m=0;m<=1;m=m+1)begin
		for(n=0;n<=1;n=n+1)begin
			j=m;
			k=n;
			#10;
		end
		end
	rst=0;
	for(m=0;m<=1;m=m+1)begin
		for(n=0;n<=1;n=n+1)begin
			j=m;
			k=n;
			#10;
		end
		end
		#10;
		$finish;
	end
endmodule
