module sipo #(parameter N=4)(input din,clk,rst,output reg [N-1:0]dout);
reg [N-1:0]shift_reg;
integer i;
always@(posedge clk)begin
	if(rst)begin
		shift_reg<={N{1'b0}};
		dout<={N{1'b0}};
	end
	else begin
		for(i=N-1;i>0;i=i-1)begin
			shift_reg[i]<=shift_reg[i-1];
			end
			shift_reg[0]<=din;
			dout<=shift_reg;
		end
	end
endmodule

module sipo_tb;
parameter N=4;
reg din,clk,rst;
wire [N-1:0]dout;
sipo #(4) dut(din,clk,rst,dout);
initial clk=0;
always #5 clk=~clk;
initial begin
	$monitor("time=%0t din=%b clk=%b rst=%b shift_reg=%b dout=%b",$time,din,clk,rst,dut.shift_reg,dout);
	rst=1;#10;
	rst=0;
	din=1;#10;
	din=1;#10;
	din=1;#10;
	din=1;#10;
#20 $finish;
end
endmodule

		
		
