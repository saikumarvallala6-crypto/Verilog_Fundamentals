module sr_ff(input s,r,clk,rst,output reg q,qb);
always@(posedge clk)begin
	if(rst)begin
		{q,qb}=2'b01;
		end
	else begin
	case ({s,r})
	2'b00: begin
	q<=q;qb<=qb; end
	2'b01: begin
	q<=0;qb<=1;end
	2'b10 : begin
	q<=1;qb<=0;end
	2'b11 : begin
	q<=1'bx;qb<=1'bx;end
	endcase
	end
	end
endmodule

module sr_tb;
reg s,r,clk,rst;
wire q,qb;
sr_ff dut(s,r,clk,rst,q,qb);
initial clk=0;
always #5 clk=~clk;
integer i,j;
initial begin 
	$monitor("s=%b r=%b clk=%b rst=%b q=%b qb=%b",s,r,clk,rst,q,qb);
	rst=1;
	for(i=0;i<=1;i=i+1)begin
		for(j=0;j<=1;j=j+1)begin
			s=i;
			r=j;
			#10;
			end
			end
	rst=0;
	for(i=0;i<=1;i=i+1)begin
		for(j=0;j<=1;j=j+1)begin
			s=i;
			r=j;
			#10;
		end
		end
		#100;
		$finish;
	end
endmodule
