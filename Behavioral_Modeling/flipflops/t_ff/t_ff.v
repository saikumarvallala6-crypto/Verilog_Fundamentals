module tff(input t,clk,rst,output reg q,qb);
always@(posedge clk)
	if(rst)begin
		q<=0;qb<=1;
		end
	else begin
		case(t) 
			1'b0:begin q<=q;qb<=qb;end
			1'b1:begin q<=~q;qb<=~qb;end
		endcase
		end
endmodule

module t_tb;
reg t,clk,rst;
wire q,qb;
tff dut(t,clk,rst,q,qb);
initial clk=0;
always #5 clk=~clk;
initial begin
	$monitor("t=%b clk=%b rst=%b q=%b qb=%b",t,clk,rst,q,qb);
/*	rst=1;clk=0;
	t=0;#5;
	t=1;#5;*/
	rst=1;
	t=0;#5;
	t=1;#5;
/*	rst=0;clk=0;
	t=0;#5;
	t=1;#5;*/
	rst=0;
	t=0;#5;
	t=1;#5;
	$finish;
	end
endmodule
