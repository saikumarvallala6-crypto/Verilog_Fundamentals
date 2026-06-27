module hs_1(input a,b,output diff,borrow);
	assign diff=a^b;
	assign borrow=~a&b;
endmodule

module hs_tb;
	reg a,b;
	wire diff,borrow;
	hs_1 dut(a,b,diff,borrow);
	initial begin
		$monitor("a=%b,b=%b,diff=%b,borrow=%b",a,b,diff,borrow);
		a=0;b=0;#10;
		a=0;b=1;#10;
		a=1;b=0;#10;
		a=1;b=1;#10;
	end
endmodule
