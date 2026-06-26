module logic_gates(input a,b,output y0,y1,y2,y3,y4,y5,y6,y7);
	not na(y0,a);
	not nb(y1,b);
	and (y2,a,b);
	or (y3,a,b);
	nand (y4,a,b);
	nor (y5,a,b);
	xor (y6,a,b);
	xnor (y7,a,b);
endmodule

module logic_gates_tb;
	reg a,b;
	wire y0,y1,y2,y3,y4,y5,y6,y7;
	logic_gates dut(a,b,y0,y1,y2,y3,y4,y5,y6,y7);
	initial begin
		$monitor("a=%b,b=%b,y0=%b,y1=%b,y2=%b,y3=%b,y4=%b,y5=%b,y6=%b,y7=%b",a,b,y0,y1,y2,y3,y4,y5,y6,y7);
		a=0;b=0;#10;
		a=0;b=1;#10;
		a=1;b=0;#10;
		a=1;b=1;#10;
	end
endmodule
