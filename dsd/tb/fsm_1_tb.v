module fsm_tb();

reg[3:0] din ; 
reg clk ;
reg rstn;
wire out;

fsm_1 UUT(
 .din(din),
 .clk(clk),
 .rstn(rstn),
 .out(out)
);

initial begin

$dumpfile("fsm_1.vcd");
$dumpvars(0,fsm_tb);

 rstn = 0; 
 clk = 0;
 din = 0;

//state change test
  #10;
   rstn = 1;
  din = 4'h1 ;

  #10;
  din = 4'h3 ;

  #10;
  din = 4'h4 ;

  #10;
  din = 4'h8 ;

  #10;
  din = 4'hD ;

  #10;
  din = 4'h9 ;

//testing to idle

  #10;
  din = 4'h1;

  #10;
  din = 4'h3 ;

  #10;
  din = 4'h6 ;

//test for reset

  #10;
  din = 4'h1;
  rstn = 0;

  #10;
  din = 4'h3 ;
  

  $finish ;

end

always 
 #5 clk = ~clk ;

endmodule