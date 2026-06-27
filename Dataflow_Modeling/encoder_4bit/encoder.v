module encoder_4bit(input [3:0]i,output y0,y1);
	assign y0=i[1]|i[3];
	assign y1=i[2]|i[3];
endmodule

module encoder_tb;
	reg [3:0]i;
	wire y0,y1;
	encoder_4bit dut(i,y0,y1);
	initial begin
		$monitor("i=%b,y0=%b,y1=%b",i,y0,y1);
		i=4'b0001;#10;
		i=4'b0010;#10;
		i=4'b0100;#10;
		i=4'b1000;#10;
	end
endmodule

