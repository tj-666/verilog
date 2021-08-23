module count_8(
 input clk,
 input rstn,
 input dir,
 input load,
 input[7:0] in,
 output[7:0] out
);
reg[7:0] counter ;

always @(posedge clk or negedge rstn)
begin : count_pro
 if(!rstn)
  counter <= 8'h00 ;
 else begin
  if(load) 
   counter <= in ;
  else
   case(dir)
    1'b0 : counter <= counter - 1'b1;
    1'b1 : counter <= counter + 1'b1;
   endcase
 end
end

assign out = counter ;

endmodule   
