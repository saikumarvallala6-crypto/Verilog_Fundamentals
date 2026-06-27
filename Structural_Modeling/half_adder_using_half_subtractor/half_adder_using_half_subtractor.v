module hs(input a,b,output diff,borr);
	assign diff=a^b;
	assign borr=~a&b;
endmodule

module ha(input a,b,output sum,carry);
	wire n1,s1;
	not (n1,a);
	hs h(.a(n1),.b(b),.diff(s1),.borr(carry));
	assign sum=~s1;
endmodule

module ha_tb;
	reg a,b;
	wire sum,carry;
	ha dut(a,b,sum,carry);
	initial begin
		$display("a=%b,b=%b,sum=%b,carry=%b",a,b,sum,carry);
		$monitor("a=%b,b=%b,sum=%b,carry=%b",a,b,sum,carry);
		a=0;b=0;#5;
		a=0;b=1;#5;
		a=1;b=0;#5;
		a=1;b=1;#5;
	end
endmodule
