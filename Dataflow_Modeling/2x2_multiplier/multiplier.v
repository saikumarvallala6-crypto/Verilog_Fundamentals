module multiplier(input [1:0] a,b,output [3:0]p);
	assign p=a*b;
endmodule

module multiplier_tb;
	reg [1:0] a,b;
	wire [3:0]p;
	multiplier dut(a,b,p);
	initial begin
		$monitor("a=%b,b=%b,p=%b",a,b,p);
		a = 2'b00; b = 2'b00; #10;
        a = 2'b00; b = 2'b01; #10;
        a = 2'b00; b = 2'b10; #10;
        a = 2'b00; b = 2'b11; #10;

        a = 2'b01; b = 2'b00; #10;
        a = 2'b01; b = 2'b01; #10;
        a = 2'b01; b = 2'b10; #10;
        a = 2'b01; b = 2'b11; #10;

        a = 2'b10; b = 2'b00; #10;
        a = 2'b10; b = 2'b01; #10;
        a = 2'b10; b = 2'b10; #10;
        a = 2'b10; b = 2'b11; #10;

        a = 2'b11; b = 2'b00; #10;
        a = 2'b11; b = 2'b01; #10;
        a = 2'b11; b = 2'b10; #10;
        a = 2'b11; b = 2'b11; #10;
	end
endmodule
			
