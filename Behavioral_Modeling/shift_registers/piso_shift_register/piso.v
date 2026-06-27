module piso #(parameter N=4)(input [N-1:0]din,input m,n,clk,rst,output reg dout);
reg [N-1:0]shift_reg;
integer i;
always@(posedge clk)begin
	if(rst)begin
		shift_reg<={N{1'b0}};
		dout<=1'b0;
		end
	else if(m)begin
		shift_reg<=din;
		end
	else begin
		case(n)
		1'b0 :begin
		//	shift_reg<=din;
		for(i=N-1;i>0;i=i-1)begin  //shift left
			shift_reg[i]<=shift_reg[i-1];
			end
			shift_reg[0]<=1'b0;
			dout<=shift_reg[N-1];end
		1'b1 :begin
		//	shift_reg<=din;
		for(i=0;i<N-1;i=i+1)begin  //shift right
			shift_reg[i]<=shift_reg[i+1];
			end
			shift_reg[N-1]<=1'b0;
			dout<=shift_reg[0];end
		endcase
		end
		end
endmodule

module piso_tb;
parameter N=4;
reg [N-1:0]din;
reg m,n,clk,rst;
wire dout;
piso #(4) dut(din,m,n,clk,rst,dout);
initial clk=0;
always #5 clk=~clk;
initial begin
	$monitor("time=%0t din=%b m=%b n=%b clk=%b rst=%b shift_reg=%b dout=%b",$time,din,m,n,clk,rst,dut.shift_reg,dout);
	din=12;
	rst=1;m=0;n=0;
	#10;

	rst=0;m=1;n=0;
	#10;
	rst=0;m=0;n=0;
	#10;#40
	
	rst=0;m=1;n=0;
	#10;
	rst=0;m=0;n=1;
	#10;
#40	$finish;
	end
endmodule

