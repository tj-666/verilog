module shift_tb();

reg clk;
reg rstn;
reg load;
reg dir;
reg[7:0] LD ;
wire cout;

shift UUT(.clk(clk), .rstn(rstn), .load(load), .dir(dir), .LD(LD), .cout(cout));

initial begin

$dumpfile("shift_out.vcd");
$dumpvars(2,shift_tb);

 clk = 0 ;
 rstn = 0 ;
 load = 0;
 dir = 0 ;
 LD = 8'h00;
 
 #10;
 rstn = 1;

 LD = 8'h55 ;
 load = 1;
 dir = 0 ;

 #100;

 LD = 8'hAA ;
 load = 1;
 dir = 1;

 #100;
 
 LD = 8'hFF;
 load = 1;
 rstn = 0 ;
 
 #20 ;
 $finish;
end 

always 
 #5 clk = ~clk ;

endmodule
