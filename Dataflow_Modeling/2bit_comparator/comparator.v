module comparator_2bit(input a1,a0,b1,b0,output G,L,E);
	assign G=(a1&~b1)|~(a1^b1)&(a0&~b0);
	assign L=(~a1&b1)|~(a1^b1)&(~a0&b0);
	assign E=~(a1^b1)&~(a0^b0);
endmodule

module comparator_tb;
	reg a1,a0,b1,b0;
	wire G,L,E;
	comparator_2bit dut(.*);
	initial begin
		$monitor("a1=%b,a0=%b,b1=%b,b0=%b,G=%b,L=%b,E=%b",a1,a0,b1,b0,G,L,E);
		a1=0;a0=0;b1=0;b0=0;#10;
		a1=0;a0=0;b1=0;b0=1;#10;
		a1=0;a0=0;b1=1;b0=0;#10;
		a1=0;a0=0;b1=1;b0=1;#10;
		a1=0;a0=1;b1=0;b0=0;#10;
		a1=0;a0=1;b1=0;b0=1;#10;
		a1=0;a0=1;b1=1;b0=0;#10;
		a1=0;a0=1;b1=1;b0=1;#10;
		a1=1;a0=0;b1=0;b0=0;#10;
		a1=1;a0=0;b1=0;b0=1;#10;
		a1=1;a0=0;b1=1;b0=0;#10;
		a1=1;a0=0;b1=1;b0=1;#10;
		a1=1;a0=1;b1=0;b0=0;#10;
		a1=1;a0=1;b1=0;b0=1;#10;
		a1=1;a0=1;b1=1;b0=0;#10;
		a1=1;a0=1;b1=1;b0=1;#10;
	end
endmodule
