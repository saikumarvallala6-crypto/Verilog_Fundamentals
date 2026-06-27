module mux_2x1(input a,b,s,output y);
	assign y=s?b:a;
endmodule

module mux_13x1(input [12:0]i,input s0,s1,s2,s3,output y);
	wire m1,m2,m3,m4,m5,m6,m7,m21,m22,m23,m24,m31,m32;
	mux_2x1 mx1(.a(i[0]),.b(i[1]),.s(s0),.y(m1));
	mux_2x1 mx2(.a(i[2]),.b(i[3]),.s(s0),.y(m2));
	mux_2x1 mx3(.a(i[4]),.b(i[5]),.s(s0),.y(m3));
	mux_2x1 mx4(.a(i[6]),.b(i[7]),.s(s0),.y(m4));
	mux_2x1 mx5(.a(i[8]),.b(i[9]),.s(s0),.y(m5));
	mux_2x1 mx6(.a(i[10]),.b(i[11]),.s(s0),.y(m6));
	mux_2x1 mx7(.a(i[12]),.b(1'b0),.s(s0),.y(m7));
	mux_2x1 mx21(.a(m1),.b(m2),.s(s1),.y(m21));
	mux_2x1 mx22(.a(m3),.b(m4),.s(s1),.y(m22));
	mux_2x1 mx23(.a(m5),.b(m6),.s(s1),.y(m23));
	mux_2x1 mx24(.a(m7),.b(1'b0),.s(s1),.y(m24));
	mux_2x1 mx31(.a(m21),.b(m22),.s(s2),.y(m31));
	mux_2x1 mx32(.a(m23),.b(m24),.s(s2),.y(m32));
	mux_2x1 mx41(.a(m31),.b(m32),.s(s3),.y(y));
endmodule

module mux_tb;
	reg [12:0]i;reg s0,s1,s2,s3;
	wire y;
	mux_13x1 dut(.*);
	initial begin
		$monitor("i=%b,s0=%b,s1=%b,s2=%b,s3=%b,y=%b",i,s0,s1,s2,s3,y);
		i=13'b1010_1010_1010_1;
		s3=0;s2=0;s1=0;s0=0;#10;
		s3=0;s2=0;s1=0;s0=1;#10;
		s3=0;s2=0;s1=1;s0=0;#10;
		s3=0;s2=0;s1=1;s0=1;#10;
		s3=0;s2=1;s1=0;s0=0;#10;
		s3=0;s2=1;s1=0;s0=1;#10;
		s3=0;s2=1;s1=1;s0=0;#10;
		s3=0;s2=1;s1=1;s0=1;#10;
		s3=1;s2=0;s1=0;s0=0;#10;
		s3=1;s2=0;s1=0;s0=1;#10;
		s3=1;s2=0;s1=1;s0=0;#10;
		s3=1;s2=0;s1=1;s0=1;#10;
		s3=1;s2=1;s1=0;s0=0;#10;
		s3=1;s2=1;s1=0;s0=1;#10;
		s3=1;s2=1;s1=1;s0=0;#10;
		s3=1;s2=1;s1=1;s0=1;#10;
	end
endmodule
