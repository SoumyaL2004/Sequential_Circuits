`timescale 1ns/1ps

module tb_Graycodecounter;
    reg clk;
    reg rst;
    wire [2:0] gray;

    // Instantiate the DUT
    Graycodecounter uut (
        .clk(clk),
        .rst(rst),
        .gray(gray)
    );

    // Clock generation: toggle every 5 ns → 100 MHz
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test sequence
    initial begin
        // Monitor signals
        $monitor("Time=%0t | rst=%b | gray=%b", $time, rst, gray);

        // Apply reset
        rst = 1;
        #10; rst = 0;
        #160;
        rst = 1;
        #10; rst = 0;

        // More counting
        #100;
        $finish;
    end
endmodule
