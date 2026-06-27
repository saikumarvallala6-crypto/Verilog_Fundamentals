module mux_2x1(input a,b,s,output y);
	assign y=s?b:a;
endmodule

module mux_4x1(input a,b,c,d,s0,s1,output y);
	assign y=s1?(s0?d:c):(s0?b:a);
endmodule

module mux_8x1(input [7:0]i,input s0,s1,s2,output y);
	wire m1,m2;
	mux_4x1 mx1(.a(i[0]),.b(i[1]),.c(i[2]),.d(i[3]),.s0(s0),.s1(s1),.y(m1));
	mux_4x1 mx2(.a(i[4]),.b(i[5]),.c(i[6]),.d(i[7]),.s0(s0),.s1(s1),.y(m2));
	mux_2x1 mx(.a(m1),.b(m2),.s(s2),.y(y));
//	mux_4x1 mx1(.a(m1),.b(m2),.c(1'b0),.d(1'b0),.s0(s2),.s1(GND),.y(y));
endmodule

module mux_tb;
	reg [7:0]i;
	reg s0,s1,s2;
	wire y;
	mux_8x1 dut(.*);
	initial begin
	 $monitor("i=%b,s0=%b,s1=%b,s2=%b,y=%b",i,s0,s1,s2,y);
	 i=8'b1010_1010;
	 s2=0;s1=0;s0=0;#10;
	 s2=0;s1=0;s0=1;#10;
	 s2=0;s1=1;s0=0;#10;
	 s2=0;s1=1;s0=1;#10;
	 s2=1;s1=0;s0=0;#10;
	 s2=1;s1=0;s0=1;#10;
	 s2=1;s1=1;s0=0;#10;
	 s2=1;s1=1;s0=1;#10;
	end
endmodule
