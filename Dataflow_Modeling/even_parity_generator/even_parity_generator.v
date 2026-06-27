module parity_gen(input a,b,c,output p_even);
	assign p_even=a^b^c;
endmodule

module parity_tb;
	reg a,b,c;
	wire p_even;
	parity_gen dut(a,b,c,p_even);
	initial begin
		$monitor("a=%b,b=%b,c=%b,p_even=%b",a,b,c,p_even);
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
