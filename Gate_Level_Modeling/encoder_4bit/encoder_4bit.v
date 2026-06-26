module encoder_4bit(input d0,d1,d2,d3,output y0,y1);
	or (y0,d1,d3);
	or (y1,d2,d3);
endmodule

module encoder_tb;
 reg d0,d1,d2,d3;
 wire y0,y1;
 encoder_4bit dut(d0,d1,d2,d3,y0,y1);
 initial begin
 $monitor("d0=%b,d1=%b,d2=%b,d3=%b,y0=%b,y1=%b",d0,d1,d2,d3,y0,y1);
 d0=1;d1=0;d2=0;d3=0;#5;
 d0=0;d1=1;d2=0;d3=0;#5;
 d0=0;d1=0;d2=1;d3=0;#5;
 d0=0;d1=0;d2=0;d3=1;#5;
 end
 endmodule


