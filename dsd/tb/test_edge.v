module test_edge();

reg clk;
reg rstn;
reg cin;
wire cout;

edge_detect uut(.clk(clk), .rstn(rstn), .cin(cin), .cout(cout));


initial 
begin

$dumpfile("edge.vcd");
$dumpvars(0,test_edge);
 rstn = 0;
 cin = 0;
 clk = 0;
 
 #10 rstn = 1 ;
 #10 cin = 1;
 #10 cin = 0 ;
 #10 cin = 1 ;
 #10 rstn = 0;

 #10 $finish ;

end

initial begin
 forever begin
  #5 clk = ~clk ;
 end
end

endmodule
