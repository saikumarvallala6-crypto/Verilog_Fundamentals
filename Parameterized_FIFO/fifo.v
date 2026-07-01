module fifo #(parameter WIDTH=8,PTR=3,SIZE=8)(clk,rst,wr_en,rd_en,din,d_out,full,empty);
input clk,rst,rd_en,wr_en;
input [WIDTH-1:0]din;
output reg[WIDTH-1:0]d_out;
output full,empty;
reg[PTR:0]wr_ptr,rd_ptr;
reg[SIZE-1:0]fifo[WIDTH-1:0];

always@(posedge clk)begin
	if(rst)begin
		wr_ptr<=0;
		rd_ptr<=0;
		d_out<=0;
	end
	else if(!full && wr_en)begin
		fifo[wr_ptr]<=din;
		wr_ptr<=wr_ptr+1;
		end
	else if(!empty && rd_en)begin
		d_out<=fifo[rd_ptr];
		rd_ptr<=rd_ptr+1;
		end
	end
//assign full=((wr_ptr=={PTR{1'b1}})&&(rd_ptr=={PTR{1'b0}})?1:0);
assign full=((wr_ptr+1'b1)==rd_ptr);
assign empty=(wr_ptr==rd_ptr)?1:0;
endmodule

module fifo_tb;
parameter WIDTH=8,PTR=3,SIZE=8;
reg clk,rst,wr_en,rd_en;
reg [WIDTH-1:0]din;
wire [WIDTH-1:0]d_out;
wire full,empty;

always #5 clk=~clk;
fifo #(WIDTH,PTR,SIZE) dut(clk,rst,wr_en,rd_en,din,d_out,full,empty);
initial begin
	$monitor("time=%0t clk=%b rst=%b wr_en=%b rd_en=%b din=%b d_out=%b ful=%b empty=%b ",$time,clk,rst,wr_en,rd_en,din,d_out,full,empty);
	clk=0;rst=1;#10;
	rst=0;wr_en=1;rd_en=0;
	din=8'b00000001;#10;
	din=8'b00000010;#10;
	din=8'b00000011;#10;
	din=8'b00000100;#10;
	din=8'b00000101;#10;
	din=8'b00000110;#10;
	din=8'b00000111;#10;
	din=8'b00001001;#10;
	rst=0;wr_en=0;rd_en=1;#100;
	$finish;

	end
	endmodule

	
