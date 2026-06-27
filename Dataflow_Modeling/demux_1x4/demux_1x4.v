module demux_1x4(input i,s0,s1,output y1,y2,y3,y4);
	assign y1=~s1?(~s0?i:0):0;
	assign y2=~s1?(s0?i:0):0;
	assign y3=s1?(~s0?i:0):0;
	assign y4=s1?(s0?i:0):0;
endmodule

module demux4_tb;
	reg i,s0,s1;
	wire y1,y2,y3,y4;
	demux_1x4 dut(i,s0,s1,y1,y2,y3,y4);
	initial begin
		$monitor("i=%b,s0=%b,s1=%b,y1=%b,y2=%b,y3=%b,y4=%b",i,s0,s1,y1,y2,y3,y4);
		i=1;s1=0;s0=0;#10;
			s1=0;s0=1;#10;
			s1=1;s0=0;#10;
			s1=1;s0=1;#10;
		#10
		i=0;s1=0;s0=0;#10;
			s1=0;s0=1;#10;
			s1=1;s0=0;#10;
			s1=1;s0=1;#10;
	end
endmodule
		
