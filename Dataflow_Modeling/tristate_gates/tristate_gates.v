module tristate_data(input a,control,output y1,y2,y3,y4);
	assign y1=control?a:1'bz;//bufif1
	assign y2=~control?a:1'bz;//bufif0
	assign y3=control?~a:1'bz;//notif1
	assign y4=~control?~a:1'bz;//notif0
endmodule

module tristate_tb;
	reg a,control;
	wire y1,y2,y3,y4;
	tristate_data dut(a,control,y1,y2,y3,y4);
	initial begin
		$monitor("a=%b,control=%b,y1=%b,y2=%b,y3=%b,y4=%b",a,control,y1,y2,y3,y4);
		a=1;control=0;#10;
		a=1;control=1;#10;
	end
endmodule
