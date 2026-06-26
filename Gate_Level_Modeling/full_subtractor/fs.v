module full_subtractor(input a,bin,c,output diff,borrow);
	wire na,x1,a1,nx1,a2;
	xor D(x1,a,bin);
	xor B(diff,c,x1);
	not (na,a);
	not (nx1,x1);
	and (a1,bin,na);
	and (a2,c,nx1);
	or (borrow,a1,a2);
endmodule

module fs_tb;
	reg a,bin,c;
	wire diff,borrow;
	full_subtractor dut(a,bin,c,diff,borrow);
	initial begin
		$monitor("a=%b,bin=%b,c=%b,diff=%b,borrow=%b",a,bin,c,diff,borrow);
		a=0;bin=0;c=0;#10;
		a=0;bin=0;c=1;#10;
		a=0;bin=1;c=0;#10;
		a=0;bin=1;c=1;#10;
		a=1;bin=0;c=0;#10;
		a=1;bin=0;c=1;#10;
		a=1;bin=1;c=0;#10;
		a=1;bin=1;c=1;#10;
	end
endmodule
