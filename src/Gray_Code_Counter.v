module Graycodecounter(
    input clk,
    input rst,
    output reg [2:0] gray
);
    reg [2:0] bin; // internal binary counter

    // Binary counter
    always @(posedge clk) begin
        if (rst)
            bin <= 3'b000;
        else
            bin <= bin + 1;
    end

    // Binary to Gray conversion
    always @(*) begin
        gray[2] = bin[2];
        gray[1] = bin[2] ^ bin[1];
        gray[0] = bin[1] ^ bin[0];
    end
endmodule
