module ram #(parameter ADDR_WIDTH=20,DATA_WIDTH=8,DEPTH=1024)(input clk,rst,wr_rd,input [DATA_WIDTH-1:0]din,input [ADDR_WIDTH-1:0]addr,output reg [DATA_WIDTH-1:0]dout);
reg [DATA_WIDTH-1:0] mem [DEPTH-1:0];
always@(posedge clk)begin
	if(rst)begin
	dout<=0;
	end
	else if(wr_rd)
			mem[addr]<=din;
		else
			dout<=mem[addr];
		end
endmodule

module ram_tb;
parameter ADDR_WIDTH=20,DATA_WIDTH=8,DEPTH=2**20;
reg clk,rst,wr_rd;
reg [DATA_WIDTH-1:0]din;
reg [ADDR_WIDTH-1:0]addr;
wire [DATA_WIDTH-1:0]dout;
ram #(ADDR_WIDTH,DATA_WIDTH,DEPTH) dut(clk,rst,wr_rd,din,addr,dout);
initial clk=0;
always #5 clk=~clk;
initial begin
	$monitor("time=%0t clk=%b rst=%b wr_rd=%b din=%b addr=%b dout=%b mem=%b",$time,clk,rst,wr_rd,din,addr,dout,dut.mem[addr]);
	rst=1;din=0;addr=0;#10;
	rst=0;wr_rd=1;
	addr=20'd123;din=8'd13;#10;
	addr=20'd103;din=8'd14;#10;
	addr=20'd106;din=8'd15;#10;
	addr=20'd110;din=8'd16;#10;

	wr_rd=0;
	addr=20'd123;#10;
	addr=20'd103;#10;
	addr=20'd106;#10;
	addr=20'd110;#10;

$finish;
end
endmodule
