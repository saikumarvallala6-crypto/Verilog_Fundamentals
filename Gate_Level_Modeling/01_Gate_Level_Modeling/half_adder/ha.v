module ha(input a,b,output sum,carry);
	xor(sum,a,b);
	and(carry,a,b);
endmodule

module ha_tb;
	reg a,b;
	wire sum,carry;
	ha dut(.a(a),.b(b),.sum(sum),.carry(carry));
	initial begin
		$monitor("a=%b,b=%b,sum=%b,carry=%b",a,b,sum,carry);
		a=0;b=0;#1;
		a=0;b=1;#1;
		a=1;b=0;#1;
		a=1;b=1;#1;
	end
endmodule
	
