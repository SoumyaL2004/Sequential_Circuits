module RingCounter(
    input clk,
    input rst,
    output reg [3:0] Ring_out
);
    always @(posedge clk) begin
        if (rst)
            Ring_out <= 4'b1000; 
        else
            Ring_out <= {Ring_out[0], Ring_out[3:1]};
    end
endmodule
