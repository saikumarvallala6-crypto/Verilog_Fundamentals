module demux_1x4(input i,s0,s1,output y0,y1,y2,y3);
	wire ns0,ns1;
	not (ns0,s0);
	not (ns1,s1);
	and a1(y0,ns0,ns1,i);
	and a2(y1,s0,ns1,i);
	and a3(y2,ns0,s1,i);
	and a4(y3,s0,s1,i);
endmodule

module demux_tb;
	reg i,s0,s1;
	wire y0,y1,y2,y3;
	demux_1x4 dut(i,s0,s1,y0,y1,y2,y3);
	initial begin
		$monitor("i=%b\t,s1=%b,s0=%b\t,y3=%b,y2=%b,y1=%b,y1=%b",i,s1,s0,y3,y2,y1,y0);
		i=1;
		s1=0;s0=0;#10;
		s1=0;s0=1;#10;
		s1=1;s0=0;#10;
		s1=1;s0=1;#10;
	end
endmodule

