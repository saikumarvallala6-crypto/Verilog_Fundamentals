module gray_binary(input [3:0]g,output [3:0]b);
	assign b[3]=g[3];
	assign b[2]=b[3]^g[2];
	assign b[1]=b[2]^g[1];
	assign b[0]=b[1]^g[0];
endmodule

module gray_binary_tb;
	reg [3:0] g;
	wire [3:0] b;
	gray_binary dut(.g(g),.b(b));
	initial begin
		$monitor("g=%b,b=%b",g,b);
		g=4'b000;#10;
		g=4'b001;#10;
		g=4'b011;#10;
		g=4'b010;#10;
		g=4'b110;#10;
		g=4'b111;#10;
		g=4'b101;#10;
		g=4'b100;#10;
	end
endmodule
