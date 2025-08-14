module GraycodeUpDowncounter(
    input clk,
    input rst,
    input dir,
    output reg [3:0] gray
);
    reg [3:0] bin; // internal binary counter

    // Binary counter
    always @(posedge clk) begin
        if (rst)
            bin <= 4'b0000;
        else begin
            if (dir)
                bin <= bin + 1;
            else
                bin <= bin - 1;
        end
    end

    // Binary to Gray conversion
    always @(*) begin
        gray[3] = bin[3];
        gray[2] = bin[3] ^ bin[2];
        gray[1] = bin[2] ^ bin[1];
        gray[0] = bin[1] ^ bin[0];
    end
endmodule
