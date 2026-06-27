module top_mux(input a,b,s,output y);
	assign y = s ? b : a;

	//assign y= ~s&a | s&b;
endmodule

module top;
	reg a,b,s; 
	wire y;

	top_mux dut(.a(a), .b(b), .s(s), .y(y));

	initial begin
		$monitor("a=%b b=%b s=%b y=%b",a,b,s,y);
		a=0; b=0; s=0; #1;
		a=0; b=1; s=0; #1;
		a=1; b=0; s=0; #1;
		a=1; b=1; s=1; #1;
		a=1'bx; b=0; s=0; #1;
	end

endmodule

