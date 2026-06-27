/*module nor_gate(input a,b,output y);
assign y=~(a|b);
endmodule*/

module lg_gts_nor(input a,b,output y0,y1,y2,y3,y4,y5,y6);
	wire o1,w1,w2,w3;
	//not
	nor_gate n_a(.a(a),.b(a),.y(y0));
	nor_gate n_b(.a(b),.b(b),.y(y1));
	//and
	nor_gate and_gate(.a(y0),.b(y1),.y(y2));
	//or
	nor_gate or1(.a(a),.b(b),.y(o1));
	nor_gate or_gate(.a(o1),.b(o1),.y(y3));
	//nand
	nor_gate nand_gate(.a(y2),.b(y2),.y(y4));
	//xnor
	nor_gate x1(.a(a),.b(b),.y(w1));
	nor_gate x2(.a(a),.b(w1),.y(w2));
	nor_gate x3(.a(w1),.b(b),.y(w3));
	nor_gate xnor_gate(.a(w2),.b(w3),.y(y5));
	//xor
	nor_gate xor_gate(.a(y5),.b(y5),.y(y6));
endmodule
module nor_gate(input a,b,output y);
assign y=~(a|b);
endmodule


module logic_gates_tb;
	reg a,b;
	wire y0,y1,y2,y3,y4,y5,y6;
	lg_gts_nor dut(a,b,y0,y1,y2,y3,y4,y5,y6);
	initial begin
		$monitor("a=%b,b=%b,y0=%b,y1=%b,y2=%b,y3=%b,y4=%b,y5=%b,y6=%b",a,b,y0,y1,y2,y3,y4,y5,y6);
		a=0;b=0;#10;
		a=0;b=1;#10;
		a=1;b=0;#10;
		a=1;b=1;#10;
	end
endmodule


