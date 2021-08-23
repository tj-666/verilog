module shift(
input clk,
input rstn,
input load, 
input dir,
input [7:0] LD,
output cout
);

reg [7:0] mem;

always @(posedge clk or posedge rstn)
begin
 if(!rstn)
  cout <= 0 ;
 else begin
  if(load)
   mem <= LD ;
  else mem <= mem ;
  case(dir)
   0 : begin 
       cout<= mem[7] ;
       mem <= mem<<1 ;
       end
   1 : begin
       cout<= mem[0];
       mem <= mem>>1 ;
       end
  endcase
 end
end

endmodule 			
  

