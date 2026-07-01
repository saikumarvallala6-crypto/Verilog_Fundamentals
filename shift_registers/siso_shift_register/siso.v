module siso #(parameter WIDTH=4)(input din,input clk,rst,output reg dout);
reg [WIDTH-1:0]shift_reg;
integer i;
always@(posedge clk)begin
	if(rst)begin
		shift_reg<={WIDTH{1'b0}};
		dout<=1'b0;
		end
	else begin
	/*	for(i=WIDTH-1;i>0;i=i-1)begin  //shift left
			shift_reg[i]<=shift_reg[i-1];
			end
			shift_reg[0]<=din;
			dout<=shift_reg[WIDTH-1];*/
		for(i=0;i<WIDTH-1;i=i+1)begin  //shift right
			shift_reg[i]<=shift_reg[i+1];
			end
			shift_reg[WIDTH-1]<=din;
			dout<=shift_reg[0];
		end
		end
endmodule

module siso_tb;
reg din,clk,rst;
wire dout;
siso #(3) dut(din,clk,rst,dout);
always #5 clk=~clk;
initial begin
$monitor("time=%0t din=%b clk=%b rst=%b shift_reg=%b dout=%b",$time,din,clk,rst,dut.shift_reg,dout);
clk=0;rst=1;din=1;#10;
rst=0;
din=1;#10;
din=0;#10;
din=1;#10;
//din=0;#10;
#50 $finish;
end
endmodule

		

