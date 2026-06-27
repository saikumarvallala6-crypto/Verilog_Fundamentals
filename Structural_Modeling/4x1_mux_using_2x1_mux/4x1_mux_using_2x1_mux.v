module mux_2x1(input a,b,s,output y);
	assign y=s?b:a;
endmodule

module mux_4x1(input a,b,c,d,s0,s1,output y);
	wire m1,m2;
	mux_2x1 mx1(a,b,s0,m1);
	mux_2x1 mx2(c,d,s0,m2);
	mux_2x1 mx(m1,m2,s1,y);
endmodule 

module mux_tb;
	reg a,b,c,d,s0,s1;
	wire y;
	mux_4x1 dut(a,b,c,d,s0,s1,y);
	initial begin
		$monitor("m:a=%b,b=%b,c=%b,d=%b,s0=%b,s1=%b,y=%b",a,b,c,d,s0,s1,y);
	s0=0;s1=0;
	a=1;b=0;c=1;d=0;#10;
	s0=1;s1=0;
	a=1;b=0;c=1;d=0;#10;
	s0=0;s1=1;
	a=1;b=0;c=1;d=0;#10;
	s0=1;s1=1;
	a=1;b=0;c=1;d=0;#10;

	s0=0;s1=0;
		a=0;b=1;c=0;d=1;#10;
	s0=1;s1=0;
		a=0;b=1;c=0;d=1;#10;
	s0=0;s1=1;
		a=0;b=1;c=0;d=1;#10;
	s0=1;s1=1;
		a=0;b=1;c=0;d=1;#10;
		$display("d:a=%b,b=%b,c=%b,d=%b,s0=%b,s1=%b,y=%b",a,b,c,d,s0,s1,y);
		$write("w:a=%b,b=%b,c=%b,d=%b,s0=%b,s1=%b,y=%b",a,b,c,d,s0,s1,y);
		$strobe("s:a=%b,b=%b,c=%b,d=%b,s0=%b,s1=%b,y=%b",a,b,c,d,s0,s1,y);
	end
endmodule
