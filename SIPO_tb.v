module SIPO_tb;
  reg clk, rst, s_in;
  wire [7:0] out;

  // Instantiate SIPO module
  SIPO uut (.clk(clk),.rst(rst),.s_in(s_in),.out(out));

  // Clock generation
  always #5 clk = ~clk;

  initial 
   begin
    clk = 0; rst = 1; s_in = 0;
    
    #10 rst = 0;
    #10 s_in = 1;
    #10 s_in = 0;
    #10 s_in = 1;
    #10 s_in = 1;
    #10 s_in = 0;
    #10 s_in = 0;
    #10 s_in = 1;
    #10 s_in = 1;
    #50 $finish;
  end

  initial begin
    $monitor("s_in=%b | out=%b", s_in, out);
  end
endmodule
