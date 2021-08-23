module count_tb();

reg clk;
reg rstn;
reg dir;
reg load;
reg[7:0] in;
wire[7:0] out;

count_8 UUT(.clk(clk), .rstn(rstn), .dir(dir), .load(load), .in(in), .out(out)) ;

initial begin
$dumpfile("count_out.vcd");
$dumpvars(0, count_tb);

clk = 0;
rstn = 0;
load = 0 ;
dir = 0;

#10;

dir = 1 ;
rstn = 1;

#200 ;
 
dir = 0;

#100 ;

load = 1;
in = 8'h26 ;

#10 load = 0 ;

#100 ;

rstn = 0 ;

#10;

$finish ;

end

always
 #5 clk = ~clk ;

endmodule
 
