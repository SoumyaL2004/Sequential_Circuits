module SIPO(input clk, rst, s_in, output reg [7:0] out);
  always@(posedge clk or posedge rst)
    begin
      if(rst)
        out <=8'b00000000;
      else
        out <= {s_in, out[7:1]};
    end
endmodule
