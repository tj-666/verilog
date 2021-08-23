module edge_detect(
 input clk, 
 input rstn,
 input cin,
 output reg cout
);

always@(posedge clk or posedge rstn) 
begin
 if(!rstn)
  cout <= 0;
 else cout = cin ? 1 : 0 ;
end 

endmodule
