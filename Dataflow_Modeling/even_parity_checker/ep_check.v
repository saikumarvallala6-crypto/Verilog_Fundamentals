module parity_checker(input a,b,c,p_even,output ep_check);
	assign ep_check=a^b^c^p_even;
endmodule

module parity_check_tb;
	reg a,b,c,p_even;
	wire ep_check;
	parity_checker dut(a,b,c,p_even,ep_check);
	initial begin
		$monitor("a=%b,b=%b,c=%b,p_even=%b,ep_check=%b",a,b,c,p_even,ep_check);
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
