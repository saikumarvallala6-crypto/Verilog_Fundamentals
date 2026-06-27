module ha(input a,b,output sum,carry);
	assign sum=a^b;
	assign carry=a&b;
endmodule

module fa(input a,b,cin,output sum,carry);
	wire w1,w2,w3;
	ha h1(.a(a),.b(b),.sum(w1),.carry(w2));
	ha h2(.a(w1),.b(cin),.sum(sum),.carry(w3));
	or (carry,w2,w3);
endmodule

module fa_tb;
	reg a,b,c;
	wire sum,carry;
	fa dut(a,b,c,sum,carry);
	initial begin
		$monitor("a=%b,b=%b,cin=%b,saleem=%b,carry=%b",a,b,c,sum,carry);
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

