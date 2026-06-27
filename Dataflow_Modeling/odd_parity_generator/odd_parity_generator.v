module oddparity_gen(input a,b,c,output p_odd);
	assign p_odd=~(a^b^c);
endmodule

module oddparity_tb;
	reg a,b,c;
	wire p_odd;
	oddparity_gen dut(a,b,c,p_odd);
	initial begin
		$monitor("a=%b,b=%b,c=%b,p_odd=%b",a,b,c,p_odd);
		a=0;b=0;c=0;#5;
		a=0;b=0;c=1;#5;
		a=0;b=1;c=0;#5;
		a=0;b=1;c=1;#5;
		a=1;b=0;c=0;#5;
		a=1;b=0;c=1;#5;
		a=1;b=1;c=0;#5;
		a=1;b=1;c=1;#5;
	end
endmodule
