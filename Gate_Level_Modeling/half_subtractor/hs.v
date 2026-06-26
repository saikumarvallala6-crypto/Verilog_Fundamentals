module half_subtractor(input a,b,output diff,borr);
	xor (diff,a,b);
	and (borr,~a,b);
endmodule

module hs_tb;
 reg a,b;
 wire diff,borr;
 half_subtractor dut(a,b,diff,borr);
 initial begin
 	$monitor("a=%b,b=%b,diff=%b,borr=%b",a,b,diff,borr);
	a=0;b=0;#10;
	a=0;b=1;#10;
	a=1;b=0;#10;
	a=1;b=1;#10;
end
endmodule
