module hs(input a,b,output diff,borr);
assign diff=a^b;
assign borr=~(a)&b;
endmodule

module fs(input a,b,c,output diff,borr);
	wire w1,w2,w3;
	hs h1(.a(a),.b(b),.diff(w1),.borr(w2));
	hs h2(.a(w1),.b(c),.diff(diff),.borr(w3));
	or (borr,w2,w3);
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

