module t_jk(input t,clk,rst,output reg q,qb);
reg j,k;
always@(*)begin
	j=t;
	k=t;
	end
always@(posedge clk)begin
	if(rst)begin
		{q,qb}<=2'b01;
		end
	else begin
		case({j,k})
			2'b00: begin q<=q;qb<=qb;end
			2'b01: begin q<=0;qb<=1;end
			2'b10: begin q<=1;qb<=0;end
			2'b11: begin q<=~q;qb<=~qb;end

		endcase
		end
		end
endmodule

module t_tb;
reg t,clk,rst;
wire q,qb;
t_jk dut(t,clk,rst,q,qb);
initial clk=0;
always #5 clk=~clk;
initial begin
	$monitor("time=%0t t=%b clk=%b rst=%b q=%b qb=%b",$time,t,clk,rst,q,qb);
	rst=1;#10;
	rst=0;
	t=0;#10;
	t=1;#10;
	t=0;#10;
	t=1;#10;
	#10 $finish;
	end
endmodule

