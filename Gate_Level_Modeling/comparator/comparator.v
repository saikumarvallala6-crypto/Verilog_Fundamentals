module comparator(input a1,a0,b1,b0,output G,L,E);	
	wire na1,na0,nb1,nb0,x1,x0,ga1,ga2,ga3,la1,la2,la3;
	not n1(na1,a1);
	not n2(na0,a0);
	not n3(nb1,b1);
	not n4(nb0,b0);
	xnor (x1,a1,b1);
	xnor (x0,a0,b0);
	and g1(ga1,nb1,a1);
	and g2(ga2,nb0,a0);
	and g3(ga3,x1,ga2);
	and l1(la1,na0,b0);
	and l2(la2,na1,b1);
	and l3(la3,la1,x1);
	or (G,ga1,ga3);
	and (E,x1,x0);
	or (L,la2,la3);
endmodule

module comp_tb;
	reg a1,a0,b1,b0;
	wire G,L,E;
	comparator dut(a1,a0,b1,b0,G,L,E);
	initial begin
		$monitor("a1=%b,a0=%b,b1=%b,b0=%b,G=%b,L=%b,E=%b",a1,a0,b1,b0,G,L,E);
		a1=0;a0=0;b1=0;b0=0;#10;
		a1=0;a0=0;b1=0;b0=1;#10;
		a1=0;a0=0;b1=1;b0=0;#10;
		a1=0;a0=0;b1=1;b0=1;#10;
		a1=0;a0=1;b1=0;b0=0;#10;
		a1=0;a0=1;b1=0;b0=1;#10;
		a1=0;a0=1;b1=1;b0=0;#10;
		a1=0;a0=1;b1=1;b0=1;#10;
		a1=1;a0=0;b1=0;b0=0;#10;
		a1=1;a0=0;b1=0;b0=1;#10;
		a1=1;a0=0;b1=1;b0=0;#10;
		a1=1;a0=0;b1=1;b0=1;#10;
		a1=1;a0=1;b1=0;b0=0;#10;
		a1=1;a0=1;b1=0;b0=1;#10;
		a1=1;a0=1;b1=1;b0=0;#10;
		a1=1;a0=1;b1=1;b0=1;#10;
	end
endmodule
		

