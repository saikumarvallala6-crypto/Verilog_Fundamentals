module oddparity_check(input a,b,c,p_odd,output odd_check);
 xnor (odd_check,a,b,c,p_odd);
endmodule

module oddcheck_tb;
	reg a,b,c,p_odd;
	wire odd_check;
	oddparity_check dut(a,b,c,p_odd,odd_check);
	initial begin
		$monitor("a=%b,b=%b,c=%b,p_odd=%b,odd_check=%b",a,b,c,p_odd,odd_check);
		a=0;b=0;c=0;p_odd=0;#5;
		a=0;b=0;c=0;p_odd=1;#5;
		a=0;b=0;c=1;p_odd=0;#5;
		a=0;b=0;c=1;p_odd=1;#5;
		a=0;b=1;c=0;p_odd=0;#5;
		a=0;b=1;c=0;p_odd=1;#5;
		a=0;b=1;c=1;p_odd=0;#5;
		a=0;b=1;c=1;p_odd=1;#5;
		a=1;b=0;c=0;p_odd=0;#5;
		a=1;b=0;c=0;p_odd=1;#5;
		a=1;b=0;c=1;p_odd=0;#5;
		a=1;b=0;c=1;p_odd=1;#5;
		a=1;b=1;c=0;p_odd=0;#5;
		a=1;b=1;c=0;p_odd=1;#5;
		a=1;b=1;c=1;p_odd=0;#5;
		a=1;b=1;c=1;p_odd=1;#5;
	end
endmodule

