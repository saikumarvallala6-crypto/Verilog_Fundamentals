module evenparity_check(input a,b,c,p_even,output even_check);
 xor (even_check,a,b,c,p_even);
endmodule

module evencheck_tb;
	reg a,b,c,p_even;
	wire even_check;
	evenparity_check dut(a,b,c,p_even,even_check);
	initial begin
		$monitor("a=%b,b=%b,c=%b,p_even=%b,even_check=%b",a,b,c,p_even,even_check);
		a=0;b=0;c=0;p_even=0;#5;
		a=0;b=0;c=0;p_even=1;#5;
		a=0;b=0;c=1;p_even=0;#5;
		a=0;b=0;c=1;p_even=1;#5;
		a=0;b=1;c=0;p_even=0;#5;
		a=0;b=1;c=0;p_even=1;#5;
		a=0;b=1;c=1;p_even=0;#5;
		a=0;b=1;c=1;p_even=1;#5;
		a=1;b=0;c=0;p_even=0;#5;
		a=1;b=0;c=0;p_even=1;#5;
		a=1;b=0;c=1;p_even=0;#5;
		a=1;b=0;c=1;p_even=1;#5;
		a=1;b=1;c=0;p_even=0;#5;
		a=1;b=1;c=0;p_even=1;#5;
		a=1;b=1;c=1;p_even=0;#5;
		a=1;b=1;c=1;p_even=1;#5;
	end
endmodule
		
