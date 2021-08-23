module fsm_1(
 input[3:0] din,
 input clk, 
 input rstn, 
 output reg out
);

parameter idle = 3'b000, s1 = 3'b001, s2 = 3'b010, s3 = 3'b011, s4 = 3'b100, s5 = 3'b101;

reg[2:0] ps, ns ;
reg[3:0] data ;

always @(posedge clk or negedge rstn)
begin : seq_logic
 if(!rstn) 
  ps <= idle ;
 else 
  ps <= ns ;
end

always @(posedge clk or negedge rstn)
begin : input_process
 if(!rstn)
  data <= 4'h0 ;
 else data <= din ;
end 

always @(din)
begin : comb_logic
out <= 1'b0 ;
 case(ps)
  idle : if(din == 4'h1)
  		  ns <= s1 ;
  		 else ns <= idle ;

  s1 : if(din == 4'h3)
        ns <= s2;
       else ns <= idle ;

  s2 : if(din == 4'h4)
   	    ns <= s3;
   	   else ns <= idle ;

  s3 : if(din == 4'h8)
   	    ns <= s4;
   	   else ns <= idle ;
  s4 : if(din == 4'hD)
   	    ns <= s5;
   	   else ns <= idle;
  s5 : if(din == 4'h9)
   	    out <= 1'b1 ;
   	   else ns <= idle ;

  default : ns <= idle ;
 endcase 
end 

endmodule