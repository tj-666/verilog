module shit_tb();

reg clk;
reg rstn;
reg load;
reg dir;
reg[7:0] LD ;
wire cout;

shit_tb UUT(.clk(clk), .rstn(rstn), .load(load), .dir(dir), .LD(LD), .cout(cout));

initial begin
$dumpfile(shift_tb.vcd);
$dumpvars(0,shift_tb);

 clk = 0;
 cin = 0 ;
 rstn = 0 ;
 load = 0;
 dir = 0 ;
 LD = 8'h00;
 
 #10;
 rstn = 1;
 load = 1;
 LD = 8'h55 ;

 dir = 0 ;

 #100;

 load = 1;
 LD = 8'hAA ;
 dir = 1;

 #100;

 load = 1;
 LD = 8'hFF;
 rstn = 0 ;
 
 #20 ;
 $finish;
end 
endmodule
