module bcd_adder #(parameter n=4)(input [n-1:0]a,b,input c,output reg [n-1:0]sum,output reg [n-1:0]cout);
reg [n:0]temp;
reg [n:0]carry;
always@(*)begin
		temp=a+b+c;
	if(temp<10)begin
		sum=temp[n-1:0];
		cout=temp[n];end
	else begin
		carry=temp[n-1:0]+6;
		sum=carry[n-1:0];
		cout=carry[n];end
	end
endmodule

module bcd_tb;
parameter n=4;
reg [n-1:0]a,b;
reg c;
wire [n-1:0]sum;
wire [n-1:0]cout;
wire [n:0]temp,carry;
bcd_adder #(n) dut(a,b,c,sum,cout);
integer i,j;
initial begin
c=0;
	for(i=0;i<(1<<n);i=i+1)begin
		for(j=0;j<(1<<n);j=j+1)begin
		a=i;
		b=j;
		#10;
		$display("%b %b %b %b  %b",a,b,c,cout,sum);
	end
	end
	$finish;
	end
endmodule

