`timescale 1ns / 1ps

module pipo_shift_register(
    input clk,              // Clock input
    input rst,              // Active-high reset
    input [3:0] data_in,    // Parallel input
    output reg [3:0] data_out // Parallel output
);

    always @(posedge clk or posedge rst)
    begin
        if(rst)
            data_out <= 4'b0000;   // Reset output
        else
            data_out <= data_in;   // Parallel load
    end

endmodule