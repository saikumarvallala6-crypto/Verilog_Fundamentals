module tristate_gates(input a,control,output y1,y2,y3,y4);
bufif1 (y1,a,control);
bufif0(y2,a,control);
notif1(y3,a,control);
notif0(y4,a,control);
endmodule

module tristate_tb;
	reg a,control;
	wire y1,y2,y3,y4;
	tristate_gates dut(a,control,y1,y2,y3,y4);
	initial begin
		$monitor("a=%b,control=%b,y1=%b,y2=%b,y3=%b,y4=%b",a,control,y1,y2,y3,y4);
		a=1;control=0;#10;
		a=1;control=1;#10;
	end
endmodule
