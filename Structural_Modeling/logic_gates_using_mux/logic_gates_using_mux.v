module mux_2x1(input a,b,s,output y);
	assign y=s?b:a;
endmodule

module logic_gates(input a,b,output y1,y2,y3,y4,y5,y6,y7);
	wire n1;
	mux_2x1 Not(.a(1'b1),.b(1'b0),.s(a),.y(y1));
	mux_2x1 And(.a(1'b0),.b(b),.s(a),.y(y2));
	mux_2x1 Or(.a(b),.b(1'b1),.s(a),.y(y3));
//	not (n1,b);
	mux_2x1 N(.a(1'b1),.b(1'b0),.s(b),.y(n1));
	mux_2x1 Nand(.a(1'b1),.b(n1),.s(a),.y(y4));
	mux_2x1 Nor(.a(n1),.b(1'b0),.s(a),.y(y5));
	mux_2x1 Xor(.a(b),.b(n1),.s(a),.y(y6));
	mux_2x1 Xnor(.a(n1),.b(b),.s(a),.y(y7));
endmodule

module logic_gates_tb;
	reg a,b;
	wire y1,y2,y3,y4,y5,y6,y7;
	logic_gates dut(a,b,y1,y2,y3,y4,y5,y6,y7);
	initial begin
		$monitor("time=%t,a=%b,b=%b,y1=%b,y2=%b,y3=%b,y4=%b,y5=%b,y6=%b,y7=%b",$time,a,b,y1,y2,y3,y4,y5,y6,y7);
		a=0;b=0;#10
		a=0;b=1;#10
		a=1;b=0;#10
		a=1;b=1;#10
		$display("time=%t,a=%b,b=%b,y1=%b,y2=%b,y3=%b,y4=%b,y5=%b,y6=%b,y7=%b",$time,a,b,y1,y2,y3,y4,y5,y6,y7);
	end
endmodule
