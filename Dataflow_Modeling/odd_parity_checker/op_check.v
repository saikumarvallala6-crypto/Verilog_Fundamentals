module oddparity_checker(input a,b,c,p_odd,output op_check);
	assign op_check=~(a^b^c^p_odd);
endmodule

module oddparity_tb;
	reg a,b,c,p_odd;
	wire op_check;
	oddparity_checker dut(a,b,c,p_odd,op_check);
	initial begin
		$monitor("a=%b,b=%b,c=%b,p_odd=%b,op_check=%b",a,b,c,p_odd,op_check);
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
