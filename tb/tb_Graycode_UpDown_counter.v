`timescale 1ns/1ps

module tb_GraycodeUpDowncounter;
    reg clk;
    reg rst;
    reg dir;
    wire [3:0] gray;

    GraycodeUpDowncounter uut (
        .clk(clk),
        .rst(rst),
        .dir(dir),
        .gray(gray)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    function [3:0] gray_to_bin;
        input [3:0] g;
        begin
            gray_to_bin[3] = g[3];
            gray_to_bin[2] = gray_to_bin[3] ^ g[2];
            gray_to_bin[1] = gray_to_bin[2] ^ g[1];
            gray_to_bin[0] = gray_to_bin[1] ^ g[0];
        end
    endfunction

    initial begin
        $monitor("Time=%0t | rst=%b | dir=%b | Gray=%b | Bin=%b",
                 $time, rst, dir, gray, gray_to_bin(gray));

        rst = 1; dir = 1;
        #10 rst = 0;
        #120;
        dir = 0;
        #120;
        rst = 1;
        #10 rst = 0;
        dir = 1;
        #80;
        $finish;
    end
endmodule
