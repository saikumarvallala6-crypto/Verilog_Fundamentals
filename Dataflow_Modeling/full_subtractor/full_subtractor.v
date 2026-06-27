module fs(input a,b,c,output diff,borrow);
	assign diff=a^b^c;
	assign borrow=(~a&b)|c&~(a^b);
//assign borrow=(b&c)+(~a&b)+(~a&b);
endmodule

module fs_tb;
	reg a,b,c;
	wire diff,borrow;
	fs dut(a,b,c,diff,borrow);
	initial begin
		$monitor("a=%b,b=%b,c=%b,diff=%b,borrow=%b",a,b,c,diff,borrow);
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
