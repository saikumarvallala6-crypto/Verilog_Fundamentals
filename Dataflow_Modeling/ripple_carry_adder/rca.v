module rca(input [2:0]a,[2:0]b,[0:0]cin,output [2:0]s,c0,c1,c2,[4:0]sum);
	assign s[0]=a[0]^b[0]^cin;
	assign c0=(a[0]&b[0])|cin&(a[0]^b[0]);
	assign s[1]=a[1]^b[1]^c0;
	assign c1=(a[1]&b[1])|(cin&(a[0]^b[0]))&(a[1]^b[1]);
	assign s[2]=a[2]^b[2]^c1;
	assign c2=(a[2]&b[2])|((a[1]&b[1])|(cin&(a[0]^b[0]))&(a[1]^b[1]))&(a[2]^b[2]);
	assign sum={c2,s};
endmodule

module rca_tb;
	reg [2:0] a,b;
	reg cin;
	wire [2:0]s,c0,c1,c2;
	wire [4:0]sum;
	rca dut(a,b,cin,s,c0,c1,c2,sum);
	initial begin
		$monitor("a=%b,b=%b,cin=%b,s=%b,c0=%b,c1=%b,c2=%b,sum=%b",a,b,cin,s,c0,c1,c2,sum);
		a=3'b101;b=3'b110;cin=0;#5;
		a=3'b011;b=3'b111;cin=0;#5;
	end
endmodule

