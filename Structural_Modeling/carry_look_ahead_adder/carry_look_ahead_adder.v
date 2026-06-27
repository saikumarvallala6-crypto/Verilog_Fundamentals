module gp_block(input a,b,output pi,gi);
	assign pi=a^b;
	assign gi=a&b;
endmodule

module carry_block(input p0,p1,p2,g0,g1,g2,cin,output c0,c1,c2,c3);
	assign c0=cin;
	assign c1=g0|p0&c0;
	assign c2=g1|(g0&p1)|(p1&p0&c0);
	assign c3=g2|(g1&p2)|(g0&p1&p2)|(p2&p1&p0&c0);
endmodule

module sum_block(input p0,p1,p2,c0,c1,c2,c3,output s0,s1,s2,cout);
	assign s0=p0^c0;
	assign s1=p1^c1;
	assign s2=p2^c2;
	assign cout=c3;
endmodule

module cla(input a0,a1,a2,b0,b1,b2,cin,output s0,s1,s2,cout);	
	wire p0,p1,p2,g0,g1,g2,c0,c1,c2,c3;
	gp_block gp1(.a(a0),.b(b0),.pi(p0),.gi(g0));
	gp_block gp2(.a(a1),.b(b2),.pi(p1),.gi(g1));
	gp_block gp3(.a(a2),.b(b2),.pi(p2),.gi(g2));

	carry_block cb1(.p0(p0),.p1(p1),.p2(p2),.g0(g0),.g1(g1),.g2(g2),.cin(cin),.c0(c0),.c1(c1),.c2(c2),.c3(c3));

	sum_block sb1(.p0(p0),.p1(p1),.p2(p2),.c0(c0),.c1(c1),.c2(c2),.c3(c3),.s0(s0),.s1(s1),.s2(s2),.cout(cout));
endmodule

module cla_tb;
	reg a0,a1,a2,b0,b1,b2,cin;
	wire s0,s1,s2,cout;
	cla dut(.*);
	initial begin
		$monitor("a0=%b,a1=%b,a2=%b,b0=%b,b1=%b,b2=%b,cin=%b,s0=%b,s1=%b,s2=%b,cout=%b",a0,a1,a2,b0,b1,b2,cin,s0,s1,s2,cout);
		{a0,a1,a2,b0,b1,b2,cin}=$urandom;
	end
endmodule


	
