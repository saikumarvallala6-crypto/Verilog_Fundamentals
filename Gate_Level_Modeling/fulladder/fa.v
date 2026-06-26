module fa(input a,b,c,output sum,carry);
	wire s0,c0,c1;
	xor xor1(s0,a,b);
	xor xor2(sum,s0,c);
	and and1(c0,a,b);
	and and2(c1,s0,c);
	or(carry,c0,c1);
endmodule

module fa_tb;
	reg a,b,c;
	wire sum,carry;
	fa dut(.a(a),.b(b),.c(c),.sum(sum),.carry(carry));
	initial begin
		$monitor("a=%b,b=%b,c=%b,sum=%b,carry=%b",a,b,c,sum,carry);
		a=0;b=0;c=0;#1;
		a=0;b=0;c=1;#1;
		a=0;b=1;c=0;#1;
		a=0;b=1;c=1;#1;
		a=1;b=0;c=0;#1;
		a=1;b=0;c=1;#1;
		a=1;b=1;c=0;#1;
		a=1;b=1;c=1;#1;
	end
endmodule

	
