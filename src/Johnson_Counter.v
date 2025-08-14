module JohnsonCounter(input clk, rst, output reg [3:0] Johnson_out);
  always@(posedge clk)
    begin
      if(rst)
        Johnson_out <= 4'b0000;
      else
        Johnson_out <= {~Johnson_out[0], Johnson_out[3:1]};
    end
endmodule
  
