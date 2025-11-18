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
    input [(adr_w-1) : 0] data_adr,  // 8 locations
    output reg [(data_w-1) : 0] data_out
);
    
parameter data_w = 8;  // 8-bit data width
parameter adr_w = 3;  // 2^3 = 8 locations
parameter size = 8;  // # of memory locations = 8
integer i;

reg [(data_w-1) : 0] mem [(size-1) : 0];  // 8x8 RAM: 8 locations, 8 bits each

always @(posedge clk) begin
    if (rst) begin
        // Reset all 8 memory locations to 0
        for (i = 0; i < size; i = i + 1) begin
            mem[i] <= {data_w{1'b0}};
        end
        data_out <= {data_w{1'b0}};
    end
    else begin
        if (w) begin  // Write to RAM operation
            mem[data_adr] <= data_in;
        end
        else begin  // Read from RAM operation
            data_out <= mem[data_adr];
        end
    end
end
endmodule
