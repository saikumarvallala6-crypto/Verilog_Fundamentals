module t_sr(input t,clk,rst,output reg q,qb);
reg s,r;
always@(*)begin
	s=t&qb;
	r=t&q;
	end
always@(posedge clk)
begin
	if(rst)begin
		{q,qb}=2'b01;end
	else
	begin
		case({s,r})
	/*	2'b01: begin q<=~q;qb<=~qb;end
		2'b10: begin q<=~q;qb<=~qb;end
		default: begin q<=q;qb<=qb;end*/
		2'b10: begin q <= 1; qb <= 0; end // Set
        2'b01: begin q <= 0; qb <= 1; end // Reset
        2'b00: begin q <= q; qb <= qb; end // Hold
        2'b11: begin q <= 1'bx; qb <= 1'bx; end // Invalid SR conditio
		
		endcase
	end
end
endmodule

module t_tb;
reg t,clk,rst;
wire q,qb;
t_sr dut(t,clk,rst,q,qb);
initial clk=0;
always #5 clk=~clk;
initial begin
	$monitor("time=%0t t=%b clk=%b rst=%b q=%b qb=%b",$time,t,clk,rst,q,qb);
	rst=1;
	t=0;#5;
	t=1;#5;
	rst=0;
	t=0;#5;
	t=1;#5;
	#10 $finish;
	end
endmodule

