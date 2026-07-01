module bi_di #(parameter WIDTH=4)(input m,din,clk,rst,output reg dout);
reg [WIDTH-1:0]shift_reg;
integer i;
always@(posedge clk)begin
	if(rst)begin
		shift_reg<={WIDTH{1'b0}};
		dout<=1'b0;
		end
/*	else if(m) begin
		for(i=WIDTH-1;i>0;i=i-1)begin  //shift left
			shift_reg[i]<=shift_reg[i-1];
			end
			shift_reg[0]<=din;
			dout<=shift_reg[WIDTH-1];
			end
	else begin
		for(i=0;i<WIDTH-1;i=i+1)begin  //shift right
			shift_reg[i]<=shift_reg[i+1];
			end
			shift_reg[WIDTH-1]<=din;
			dout<=shift_reg[0];*/
		else  begin
		case(m)
			1'b1 :begin
			for(i=WIDTH-1;i>0;i=i-1)begin  //shift left
					shift_reg[i]<=shift_reg[i-1];
					end
					shift_reg[0]<=din;
					dout<=shift_reg[WIDTH-1];end
			1'b0 :begin
			for(i=0;i<WIDTH-1;i=i+1)begin  //shift right
					shift_reg[i]<=shift_reg[i+1];
					end
					shift_reg[WIDTH-1]<=din;
					dout<=shift_reg[0];end

		endcase
		end
		end
endmodule

module bi_tb;
reg m,din,clk,rst;
wire dout;
bi_di #(3) dut(m,din,clk,rst,dout);
always #5 clk=~clk;
initial begin
$monitor("time=%0t m=%b din=%b clk=%b rst=%b shift_reg=%b dout=%b",$time,m,din,clk,rst,dut.shift_reg,dout);
clk=0;rst=1;din=1;#10;

rst=0;m=0; //right shift
din=1;#10;
din=1;#10;
din=1;#10;

din=0;#10;
din=0;#10;
din=0;#10;

rst=0;m=1;  //left shift
din=1;#10;
din=1;#10;
din=1;#10;

din=0;#10;
din=0;#10;
din=0;#10;
 $finish;
end
endmodule


