module mealy1011(input clk,rst,x, output reg y);

parameter  s0 = 3'b000,
           s1 = 3'b001,
           s2 = 3'b010,
           s3 = 3'b011;
	reg [2:0] current_s, next_s;

always@(posedge clk)begin
if (rst)
   current_s <= s0;
else 
    current_s = next_s;
end

always@(*)begin
y=0;
case (current_s)
     s0: if(x) next_s <= s1;
         else  next_s <= s0;
	  s1: if(x) next_s <= s1;
         else  next_s <= s2;
	  s2: if(x) next_s <= s3;
         else  next_s <= s0;
	  s3: if(x) begin next_s <= s1;
	  				y=1;end
		  else next_s <= s2;
endcase
	end
/*always@(*)begin
case(current_s)
s3:if(x) y=1;
default: y=0;
endcase
end*/
	endmodule

module top;

    reg clk;
    reg rst;
    reg x;
    wire y;
integer count=0;
    mealy1011 dut(clk,rst,x,y);
	initial clk=0;
    always #5 clk=~clk;

    initial begin
        $monitor("Time=%0t  clk=%b rst=%b x=%b  y=%b count=%0d",$time,clk,rst, x, y,count);
    rst=1;#15;
	rst=0;#10;
	x=1;#10;
	x=0;#10;
	x=1;#10;
	x=1;#10;
	x=0;#10;
	x=1;#10;
	x=1;#10;
     $finish;
    end
always@(posedge y)begin
count<=count+1;
end

endmodule	
