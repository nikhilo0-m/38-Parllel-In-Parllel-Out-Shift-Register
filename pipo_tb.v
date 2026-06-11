`timescale 1ns/1ps

module pipo_shift_register_tb;

    reg clk;
    reg rst;
    reg [3:0] data_in;
    wire [3:0] data_out;

    // Instantiate DUT
    pipo_shift_register uut(
        .clk(clk),
        .rst(rst),
        .data_in(data_in),
        .data_out(data_out)
    );

    // Clock Generation
    always #5 clk = ~clk;

    initial
    begin
        $monitor("Time=%0t rst=%b data_in=%b data_out=%b",
                  $time, rst, data_in, data_out);

        clk = 0;
        rst = 1;
        data_in = 4'b0000;

        // Apply reset
        #10 rst = 0;

        // Load data
        data_in = 4'b1010; #10;
        data_in = 4'b1100; #10;
        data_in = 4'b0111; #10;

        $finish;
    end

endmodule
