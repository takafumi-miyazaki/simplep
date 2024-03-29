`timescale 1ps/1ps
module program_counter_tp;
   reg clk;
   reg rst;
   reg [3:0] A;
   wire [3:0] B;

   parameter STEP = 1000;

   program_counter program_counter(.clk(clk), .rst(rst),
				   .A(A), .B(B));
   
   always begin
      clk = 1; #(STEP/2);
      clk = 0; #(STEP/2);
   end
   
   initial begin
      A = 4'b0000;
      #(STEP/2) A = 4'b0001;      
      #(STEP/2) A = 4'b0010;
      #(STEP/2) A = 4'b0011;
      #(STEP/2) A = 4'b0100;
      #(STEP/2) A = 4'b0101;      
      $finish;
   end

   initial $monitor($time, "clk=%b A=%b B=%b", rst, clk, A, B);
         
endmodule // program_counter

   

  
