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

    initial begin
        $monitor("Time=%0t | rst=%b | dir=%b | Gray=%b", 
                  $time, rst, dir, gray);

        rst = 1; dir = 1;
        #10;
        rst = 0;
        #160;
        dir = 0;
        #160;
        rst = 1;
        #10;
        rst = 0;
        dir = 1;
        #80;
        $stop;
    end
endmodule
