module mux_4x1(input a,b,c,d,s0,s1,output y);
	assign y=s1?(s0?d:c):(s0?b:a);
endmodule

module mux_4x1tb;
	reg a,b,c,d,s0,s1;
	wire y;
	mux_4x1 dut(a,b,c,d,s0,s1,y);
	initial begin
		$monitor("a=%b,b=%B,c=%b,d=%b,s0=%b,s1=%b,y=%b",a,b,c,d,s0,s1,y);
		a=1;b=0;c=1;d=1;
		s1=0;s0=0;#10;
		s1=0;s0=1;#10;
		s1=1;s0=0;#10;
		s1=1;s0=1;#10;
	end
endmodule
