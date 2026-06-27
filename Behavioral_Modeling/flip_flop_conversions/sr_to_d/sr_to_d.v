module d_sr(input d,clk,rst,output reg q,qb);
reg s,r;
always@(*)begin
	s=d;
	r=~d;
	end
always@(posedge clk)begin
	if(rst)begin
		{q,qb}<=2'b01;
		end
	else begin
		case({s,r})
			2'b00: begin q<=q;qb<=qb;end
			2'b01: begin q<=0;qb<=1;end
			2'b10: begin q<=1;qb<=0;end
			default: begin q<=q;qb<=qb;end

		endcase
		end
		end
endmodule

module d_sr_tb;
reg d,clk,rst;
wire q,qb;
d_sr dut(d,clk,rst,q,qb);
initial clk=0;
always #5 clk=~clk;
initial begin
	$monitor("time=%0t d=%b clk=%b rst=%b q=%b qb=%b",$time,d,clk,rst,q,qb);
	rst=1;
	d=0;#10;
	d=1;#10;
	rst=0;
	d=0;#10;
	d=1;#10;
	d=0;#10;
	d=1;#10;
	#10 $finish;
	end
endmodule


		
