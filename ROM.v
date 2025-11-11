`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2025 02:01:54 PM
// Design Name: 
// Module Name: ROM
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

module ROM (ROM_data, ROM_addr);
    output reg [3:0] ROM_data;  // 4-bit output
    input [2:0] ROM_addr;  // 3-bit address = 8 locations
    
    always @(ROM_addr) begin
        case (ROM_addr)
            3'd0: ROM_data = 4'b0000;  // Location 0
            3'd1: ROM_data = 4'b1100;  // Location 1  
            3'd2: ROM_data = 4'b0110;  // Location 2
            3'd3: ROM_data = 4'b0111;  // Location 3
            3'd4: ROM_data = 4'b1000;  // Location 4
            3'd5: ROM_data = 4'b0001;  // Location 5
            3'd6: ROM_data = 4'b1101;  // Location 6
            3'd7: ROM_data = 4'b1110;  // Location 7
        endcase
    end
endmodule