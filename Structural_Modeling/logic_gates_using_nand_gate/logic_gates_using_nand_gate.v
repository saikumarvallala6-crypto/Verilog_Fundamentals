module nand_gate(input a,b,output y);
 assign y=~(a&b);
endmodule

module lg_gts_nand(input a,b,output y0,y1,y2,y3,y4,y5,y6);
	wire a1,x1,x2,x3;
	//not
	nand_gate nt_a(.a(a),.b(a),.y(y0));
	nand_gate nt_b(.a(b),.b(b),.y(y1));
	//and
	nand_gate and1(.a(a),.b(b),.y(a1));
	nand_gate and_gate(.a(a1),.b(a1),.y(y2));
	//or
	// not of a and b are taken directly from above not gate
	nand_gate or_gate(.a(y0),.b(y1),.y(y3));
	//nor
	//nor is obtained by not of or, y3 is or of a,b.
	nand_gate nor_gate(.a(y3),.b(y3),.y(y4));
	//xor
	nand_gate xor_1(.a(a),.b(b),.y(x1));
	nand_gate xor_2(.a(a),.b(x1),.y(x2));
	nand_gate xor_3(.a(x1),.b(b),.y(x3));
	nand_gate xor_gate(.a(x2),.b(x3),.y(y5));
	//xnor
	//obtained by not of xor
	nand_gate xnor_gate(.a(y5),.b(y5),.y(y6));
endmodule

module logic_gates_tb;
	reg a,b;
	wire y0,y1,y2,y3,y4,y5,y6;
	lg_gts_nand dut(a,b,y0,y1,y2,y3,y4,y5,y6);
	initial begin
		$monitor("a=%b,b=%b,y0=%b,y1=%b,y2=%b,y3=%b,y4=%b,y5=%b,y6=%b",a,b,y0,y1,y2,y3,y4,y5,y6);
		a=0;b=0;#10;
		a=0;b=1;#10;
		a=1;b=0;#10;
		a=1;b=1;#10;
	end
endmodule


