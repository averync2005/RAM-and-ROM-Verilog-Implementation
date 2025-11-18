`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2025 01:40:56 PM
// Design Name: 
// Module Name: RAM
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module RAM (
    input clk, rst, w,
    input [7:0] data_in,
    input [2:0] data_adr,
    output reg [7:0] data_out
);

    parameter data_w = 8;
    parameter adr_w = 3;
    parameter size = 8;
    integer i;

    reg [data_w-1:0] mem [size-1:0];

    always @(posedge clk) begin
        if (rst) begin
            for (i = 0; i < size; i = i + 1) begin
                mem[i] <= {data_w{1'b0}};
            end
            data_out <= {data_w{1'b0}};
        end
        else begin
            if (w)
                mem[data_adr] <= data_in;
            else
                data_out <= mem[data_adr];
        end
    end

endmodule
