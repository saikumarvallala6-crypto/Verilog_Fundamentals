module cla(input a2,a1,a0,b2,b1,b0,cin,output [2:0]s,cout);
	assign s[0]=a0^b0^cin;
	assign s[1]=a1^b1^((a0&b0)|cin&(a0^b0));
	assign s[2]=a2^b2^((a1&b1)|((a1^b1)&((a0&b0)|cin&(a0^b0))));
	assign cout=(a2&b2)|((a2^b2)&((a1&b1)|((a1^b1)&((a0&b0)|cin&(a0^b0)))));
endmodule

module cla_tb;
	reg a2,a1,a0,b2,b1,b0,cin;
	wire [2:0]s,cout;
	cla dut(a2,a1,a0,b2,b1,b0,cin,s,cout);
	initial begin
		$monitor("a2=%b,a1=%b,a0=%b,b2=%b,b1=%b,b0=%b,cin=%b,s=%b,cout=%b",a2,a1,a0,b2,b1,b0,cin,s,cout);
		a2=0;a1=1;a0=1;b2=1;b1=1;b0=1;cin=0;#5;
		a2=1;a1=0;a0=1;b2=1;b1=1;b0=0;cin=0;#5;
	end
endmodule
