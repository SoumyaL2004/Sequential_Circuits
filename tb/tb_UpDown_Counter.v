`timescale 1ns/1ps

module tb_UpDownCounter;
    reg clk;
    reg rst;
    reg dir;
    wire [3:0] q;

    // Instantiate DUT
    UpDownCounter uut (
        .clk(clk),
        .rst(rst),
        .dir(dir),
        .q(q)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $monitor("Time=%0t | rst=%b | dir=%b | q=%b", $time, rst, dir, q);

        rst = 1; dir = 1;
        #10;
        rst = 0;

        #200;
        dir = 0;
        #200;
        rst = 1;
        #10;
        rst = 0;
        dir = 0;
        #100;

        $finish;
    end
endmodule
