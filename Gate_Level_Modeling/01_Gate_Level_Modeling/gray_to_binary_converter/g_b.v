module g_b(input [3:0]g,output [3:0]b);
	buf (b[3],g[3]);
	xor x1(b[2],g[2],b[3]);
	xor x2(b[1],g[1],b[2]);
	xor x3(b[0],g[0],b[1]);
endmodule

module g_b_tb;
	reg [3:0]g;
	wire [3:0]b;
	g_b dut(g,b);
	initial begin
		$monitor("g=%b,b=%b",g,b);
		g=4'b0000;#10;
		g=4'b0001;#10;
		g=4'b0010;#10;
		g=4'b0011;#10;
		g=4'b0100;#10;
		g=4'b0101;#10;
		g=4'b0110;#10;
		g=4'b0111;#10;
		g=4'b1000;#10;
		g=4'b1001;#10;
		g=4'b1010;#10;
		g=4'b1011;#10;
		g=4'b1100;#10;
		g=4'b1101;#10;
		g=4'b1110;#10;
		g=4'b1111;#10;
	end
endmodule

