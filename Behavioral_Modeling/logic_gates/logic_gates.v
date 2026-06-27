module logic_gates #(parameter n=4)(input [n-1:0] a,b,input [2:0]sel,output reg y);
always@(*)begin
	if(sel==3'b000)
		y=~a;
	else if(sel==3'b001)
		y=a&b;
	else if(sel==3'b010)
		y=a|b;
	else if(sel==3'b011)
		y=~(a&b);
	else if(sel==3'b100)
		y=~(a|b);
	else if(sel==3'b101)
		y=a^b;
	else if(sel==3'b110)
		y=a~^b;
	else 
		y=~b;
	end
endmodule

module lg_tb;
parameter n=4;
reg [n-1:0]a,b;
reg [2:0]sel;
wire y;
logic_gates #(n) dut(a,b,sel,y);
integer i;
initial begin
	a=5;b=7;
	for(i=0;i<(1<<3);i=i+1)begin
		sel=i;
		#10;
		$display("%b\t%b\t%b\t%b",a,b,sel,y);
	end
	$finish;
	end
endmodule

