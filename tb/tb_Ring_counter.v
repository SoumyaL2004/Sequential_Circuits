`timescale 1ns/1ps

module tb_RingCounter;
    reg clk;
    reg rst;
    wire [3:0] Ring_out;

    RingCounter uut (
        .clk(clk),
        .rst(rst),
        .Ring_out(Ring_out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $monitor("Time=%0t | rst=%b | Ring_out=%b", $time, rst, Ring_out);

        rst = 1;
        #10;        
        rst = 0;

        #80;

        rst = 1;
        #10;
        rst = 0;
        #60;

        $finish;
    end
endmodule
