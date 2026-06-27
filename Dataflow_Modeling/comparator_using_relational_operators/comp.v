module comp(input [1:0]a,[1:0]b,output G,L,E);
	assign G=(a>b);
	assign L=(a<b);
	assign E=(a==b);
 // Equality: both bits must match
//    assign E = (a[1] ~^ b[1]) & (a[0] ~^ b[0]);

    // Greater: MSB comparison first, then LSB if MSBs are equal
  //  assign G = (a[1] & ~b[1]) | 
      //            ((a[1] ~^ b[1]) & (a[0] & ~b[0]));

    // Less: MSB comparison first, then LSB if MSBs are equal
    //assign L = (~a[1] & b[1]) | 
        //          ((a[1] ~^ b[1]) & (~a[0] & b[0]));

	
endmodule

module comp_tb;
	reg [1:0] a,b;
	wire G,L,E;
	comp dut(a,b,G,L,E);
	initial begin
		$monitor("a=%b,b=%b,G=%b,L=%b,E=%b",a,b,G,L,E);
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
