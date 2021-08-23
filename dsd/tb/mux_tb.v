module mux_tb();

reg[1:0] sel;
reg[7:0] A ;
reg[7:0] B ;
reg[7:0] C ;
reg[7:0] D ;
wire[7:0] S ;

mux4x1 UUT(
 .sel(sel),
 .A(A),
 .B(B),
 .C(C),
 .D(D),
 .S(S)
 );

initial begin

 $dumpfile("mux.vcd") ;
 $dumpvars(0,mux_tb);
 
 A = 8'hff ;
 B = 8'h55 ;
 C = 8'hAA ;
 D = 8'h22 ;

 #10 sel = 2'b11 ;
 #10 sel = 2'b10 ;
 #10 sel = 2'b01 ;
 #10 sel = 2'b00 ;

 #10 $finish;

end

endmodule


