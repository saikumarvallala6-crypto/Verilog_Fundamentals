module mux_2x1(input a,b,s,output y);
	assign y=s?b:a;
endmodule

module mux_4x1(input a,b,c,d,s0,s1,output y);
	assign y=s1?(s0?d:c):(s0?b:a);
endmodule

module mux_16x1(input [15:0]i,input s0,s1,s2,s3,output y);
	wire m1,m2,m3,m4;
	wire m5,m6;
	mux_4x1 mx1(.a(i[0]),.b(i[1]),.c(i[2]),.d(i[3]),.s0(s0),.s1(s1),.y(m1));
	mux_4x1 mx2(.a(i[4]),.b(i[5]),.c(i[6]),.d(i[7]),.s0(s0),.s1(s1),.y(m2));
	mux_4x1 mx3(.a(i[8]),.b(i[9]),.c(i[10]),.d(i[11]),.s0(s0),.s1(s1),.y(m3));
	mux_4x1 mx4(.a(i[12]),.b(i[13]),.c(i[14]),.d(i[15]),.s0(s0),.s1(s1),.y(m4));
	mux_2x1 mx5(.a(m1),.b(m2),.s(s2),.y(m5));
	mux_2x1 mx6(.a(m3),.b(m4),.s(s2),.y(m6));
	mux_2x1 mx7(.a(m5),.b(m6),.s(s3),.y(y));
//	mux_4x1 mx5(.a(m1),.b(m2),.c(m3),.d(m4),.s0(s2),.s1(s3),.y(y));
endmodule

module mux_tb;
	reg [15:0]i;
	reg s0,s1,s2,s3;
	wire y;
	mux_16x1 dut(.*);
	initial begin
	 $monitor("i=%b,s0=%b,s1=%b,s2=%b,s3=%b,y=%b",i,s0,s1,s2,s3,y);
	 i=16'b1010_1010_1010_1010;
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
