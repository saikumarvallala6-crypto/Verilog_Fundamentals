module binary_gray(input [3:0]b, output [3:0]g);
assign g[3]=b[3];
assign g[2]=b[3]^b[2];
assign g[1]=b[2]^b[1];
assign g[0]=b[1]^b[0];
endmodule

module b_g;
reg[3:0]b;
wire[3:0]g;

binary_gray dut(b,g);
initial begin
	$monitor("b=%b g=%b",b,g);
	b=4'b0000;#5;
	b=4'b0001;#5;
	b=4'b0010;#5;
	b=4'b0011;#5;
	b=4'b0100;#5;
	b=4'b0101;#5;
	b=4'b0110;#5;
	b=4'b0111;#5;
	b=4'b1000;#5;
	b=4'b1001;#5;
	b=4'b1010;#5;
	b=4'b1011;#5;
	b=4'b1100;#5;
	b=4'b1101;#5;
	b=4'b1110;#5;
	b=4'b1111;#5;

	end
	endmodule

