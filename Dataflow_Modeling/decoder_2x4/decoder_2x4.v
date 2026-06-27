module decoder_2x4(input i0,i1,output [3:0]y);
	assign y[0]=~i0&~i1;
	assign y[1]=i0&~i1;
	assign y[2]=~i0&i1;
	assign y[3]=i0&i1;
endmodule

module decoder_tb;
	reg i0,i1;
	wire [3:0]y;
	decoder_2x4 dut(i0,i1,y);
	initial begin
		$monitor("i0=%b,i1=%b,y=%b",i0,i1,y);
		i0=0;i1=0;#10;
		i0=1;i1=0;#10;
		i0=0;i1=1;#10;
		i0=1;i1=1;#10;
	end
endmodule

