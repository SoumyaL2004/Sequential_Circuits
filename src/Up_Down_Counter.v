module UpDownCounter(input dir, clk, rst, output reg [3:0] q);
  always@(posedge clk)
    begin
      if(rst)
        q <= 4'b0000;
      else
        begin
          if(dir)
            q <= q+1;
          else
            q <= q-1;
        end
    end
endmodule
