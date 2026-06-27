module demux_1x2(input i,s,output x,y);
	assign x=~s? i:0;
	assign y=s? i:0;
endmodule

module demux_tb;
	reg i,s;
	wire x,y;

	demux_1x2 dut(.i(i),.s(s),.x(x),.y(y));
	initial begin
	 $monitor("i=%b,s=%b,x=%b,y=%b",i,s,x,y);
	 i=1;s=0;#1;
	 i=1;s=1;#1;
	 i=0;s=0;#1;
	 i=0;s=1;#1;
	end
endmodule

