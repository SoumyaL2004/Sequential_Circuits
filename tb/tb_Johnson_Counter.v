`timescale 1ns/1ps

module tb_JohnsonCounter;
    reg clk;
    reg rst;
    wire [3:0] Johnson_out;

    JohnsonCounter uut (
        .clk(clk),
        .rst(rst),
        .Johnson_out(Johnson_out)
    );

    // Clock generation: toggle every 5 ns → 100 MHz
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test sequence
    initial begin
        $monitor("Time=%0t | rst=%b | Johnson_out=%b", $time, rst, Johnson_out);

        rst = 1;
        #10; 
        rst = 0;
        #100;
        rst = 1;
        #10;
        rst = 0;

        #60;
        $stop;
    end
endmodule
