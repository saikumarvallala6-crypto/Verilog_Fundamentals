module decoder_2x4(input d0,d1,output y0,y1,y2,y3);
	and (y0,~d0,~d1);
	and (y1,d0,~d1);
	and (y2,~d0,d1);
	and (y3,d0,d1);
endmodule

module decoder_tb;
	reg d0,d1;
	wire y0,y1,y2,y3;
	decoder_2x4 dut(d0,d1,y0,y1,y2,y3);
	initial begin
		$monitor("d0=%b,d1=%b,y0=%b,y1=%b,y2=%b,y3=%b",d0,d1,y0,y1,y2,y3);
		d0=0;d1=0;#10;
		d0=0;d1=1;#10;
		d0=1;d1=0;#10;
		d0=1;d1=1;#10;
	end
endmodule
