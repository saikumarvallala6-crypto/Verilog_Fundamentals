module oddparity_gen(input a,b,c,output p_odd);
	xnor(p_odd,a,b,c);
endmodule

module oddgen_tb;
	reg a,b,c;
	wire p_odd;
	oddparity_gen dut(a,b,c,p_odd);
	initial begin
		$monitor("a=%b,b=%b,c=%b,p_odd=%b",a,b,c,p_odd);
		a=0;b=0;c=0;#10;
		a=0;b=0;c=1;#10;
		a=0;b=1;c=0;#10;
		a=0;b=1;c=1;#10;
		a=1;b=0;c=0;#10;
		a=1;b=0;c=1;#10;
		a=1;b=1;c=0;#10;
		a=1;b=1;c=1;#10;
	end
endmodule
