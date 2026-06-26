module mux_4x1(input i0,i1,i2,i3,s0,s1,output y);
	wire n0,n1,x0,x1,x2,x3;
	not (n0,s0);
	not (n1,s1);
	and a1(x0,i0,n0,n1);
	and a2(x1,i1,n0,s1);
	and a3(x2,i2,s0,n1);
	and a4(x3,i3,s0,s1);
	or(y,x0,x1,x2,x3);
endmodule

module mux_tb;
	reg i0,i1,i2,i3,s0,s1;
	wire y;
	mux_4x1 uut(i0,i1,i2,i3,s0,s1,y);
	initial begin
		$monitor("i0=%b,i1=%b,i2=%b,i3=%b,s0=%b,s1=%b,y=%b",i0,i1,i2,i3,s0,s1,y);
		s0=0;s1=0;i0=1;i1=0;i2=0;i3=0;#10;
		s0=0;s1=1;i0=0;i1=1;i2=0;i3=0;#10;
		s0=1;s1=0;i0=0;i1=0;i2=1;i3=0;#10;
		s0=1;s1=1;i0=0;i1=0;i2=0;i3=1;#10;
	end
endmodule


