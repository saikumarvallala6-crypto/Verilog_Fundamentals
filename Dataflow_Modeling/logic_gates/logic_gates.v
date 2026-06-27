module logic_gates(input a,b,output y0,y1,y2,y3,y4,y5,y6);
	assign {y0,y1,y2,y3,y4,y5,y6}={~a,a&b,a|b,~(a&b),~(a|b),a^b,a~^b};
endmodule

module logic_gates_tb;
	reg a,b;
	wire y0,y1,y2,y3,y4,y5,y6;
	logic_gates dut(a,b,y0,y1,y2,y3,y4,y5,y6);
	initial begin
		$monitor("a=%b,b=%b,y0=%b,y1=%b,y2=%b,y3=%b,y4=%b,y5=%b,y6=%b",a,b,y0,y1,y2,y3,y4,y5,y6);
		a=0;b=0;#10;
		$display("not=%b\nand=%b\nor=%b\nnand=%b\nnor=%b\nxor=b\nxnor=%b",y0,y1,y2,y3,y4,y5,y6);
		a=0;b=1;#10;
		$display("not=%b\nand=%b\nor=%b\nnand=%b\nnor=%b\nxor=b\nxnor=%b",y0,y1,y2,y3,y4,y5,y6);
		a=1;b=0;#10;
		$display("not=%b\nand=%b\nor=%b\nnand=%b\nnor=%b\nxor=b\nxnor=%b",y0,y1,y2,y3,y4,y5,y6);
		a=1;b=1;#10;
		$display("not=%b\nand=%b\nor=%b\nnand=%b\nnor=%b\nxor=b\nxnor=%b",y0,y1,y2,y3,y4,y5,y6);
	end
endmodule
