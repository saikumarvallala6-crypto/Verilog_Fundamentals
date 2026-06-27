module decoder(input i0,i1,output y0,y1,y2,y3);//2x4
	assign y0=~(i1)&~(i0);
	assign y1=~(i1)&i0;
	assign y2=i1&~(i0);
	assign y3=i1&i0;
endmodule

module logic_gates(input a,b,output y0,y1,y2,y3,y4,y5,y6,y7);
	wire o1,o2,o3,na1,na2,na3,x1,x2,xn1,xn2;
	decoder nt_a(.i0(a),.i1(1'b0),.y0(y0),.y1(GND),.y2(GND),.y3(GND));
	decoder nt_b(.i0(1'b0),.i1(b),.y0(y1),.y1(GND),.y2(GND),.y3(GND));
	decoder and_gate(.i0(a),.i1(b),.y0(GND),.y1(GND),.y2(GND),.y3(y2));
	decoder or_g(.i0(a),.i1(b),.y0(GND),.y1(o1),.y2(o2),.y3(o3));
	or (y3,o1,o2,o3);
	decoder nand_g(.i0(a),.i1(b),.y0(na1),.y1(na2),.y2(na3),.y3(GND));
	or (y4,na1,na2,na3);
	decoder nor_gate(.i0(a),.i1(b),.y0(y5),.y1(GND),.y2(GND),.y3(GND));
	decoder xor_g(.i0(a),.i1(b),.y0(GND),.y1(x1),.y2(x2),.y3(GND));
	or (y6,x1,x2);
	decoder xnor_g(.i0(a),.i1(b),.y0(xn1),.y1(GND),.y2(GND),.y3(xn2));
	or (y7,xn1,xn2);
endmodule

module logic_gates_tb;
	reg a,b;
	wire y0,y1,y2,y3,y4,y5,y6,y7;
	logic_gates dut(.*);
	initial begin
		$monitor("a=%b,b=%b,y0=%b,y1=%b,y2=%b,y3=%b,y4=%b,y5=%b,y6=%b,y7=%b",a,b,y0,y1,y2,y3,y4,y5,y6,y7);
		a=0;b=0;#10;
		a=0;b=1;#10;
		a=1;b=0;#10;
		a=1;b=1;#10;
	end
endmodule

	

