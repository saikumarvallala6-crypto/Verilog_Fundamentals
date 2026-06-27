module fulladder(input a,b,c,output sum,carry);
	assign sum=a^b^c;
	assign carry=a&b|c&(a^b);
endmodule

module rca(input a0,a1,a2,b0,b1,b2,cin,output s0,s1,s2,cout);
	wire c1,c2;
	fulladder f1(.a(a0),.b(b0),.c(cin),.sum(s0),.carry(c1));
	fulladder f2(.a(a1),.b(b1),.c(c1),.sum(s1),.carry(c2));
	fulladder f3(.a(a2),.b(b2),.c(c2),.sum(s2),.carry(cout));
endmodule

module rca_tb;
	reg a0,a1,a2,b0,b1,b2,cin;
	wire s0,s1,s2,cout;
	rca dut(a0,a1,a2,b0,b1,b2,cin,s0,s1,s2,cout);
	initial begin
		$monitor("a0=%b,a1=%b,a2=%b,b0=%b,b1=%b,b2=%b,cin=%b,s0=%b,s1=%b,s2=%b,cout=%b,\tadd=%d",a0,a1,a2,b0,b1,b2,cin,s0,s1,s2,cout,{cout,s2,s1,s0});
		a2=0;a1=1;a0=1;b2=0;b1=1;b0=1;cin=0;#5;//3+7
		a2=1;a1=0;a0=1;b2=1;b1=1;b0=0;cin=0;#5;//5+6
		a2=1;a1=1;a0=1;b2=1;b1=1;b0=1;cin=0;#5;//7+7
	end
endmodule
