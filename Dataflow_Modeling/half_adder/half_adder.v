module ha_1(input a,b,output sum,carry);
	assign sum=a^b;
	assign carry=a&b;
endmodule

module ha_tb;
	reg a,b;
	wire sum,carry;
	ha_1 dut(a,b,sum,carry);
	initial begin
		$monitor("a=%b,b=%b,sum=%b,carry=%b",a,b,sum,carry);
		a=0;b=0;#10;
		a=0;b=1;#10;
		a=1;b=0;#10;
		a=1;b=1;#10;
	end
endmodule
