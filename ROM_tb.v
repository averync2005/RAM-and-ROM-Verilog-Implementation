`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2025 02:08:06 PM
// Design Name: 
// Module Name: ROM_tb
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

module ROM_tb;
    // Testbench signals
    reg [2:0] ROM_addr;
    wire [3:0] ROM_data;
    
    // Instantiate the Unit Under Test (UUT)
    ROM UUT (
        .ROM_data(ROM_data),
        .ROM_addr(ROM_addr)
    );
    
    // Test procedure
    initial begin
        // Initialize signals
        ROM_addr = 3'b000;
        
        // Test all 8 addresses
        ROM_addr = 3'b000; #10;  // Address 0
        ROM_addr = 3'b001; #10;  // Address 1
        ROM_addr = 3'b010; #10;  // Address 2
        ROM_addr = 3'b011; #10;  // Address 3
        ROM_addr = 3'b100; #10;  // Address 4
        ROM_addr = 3'b101; #10;  // Address 5
        ROM_addr = 3'b110; #10;  // Address 6
        ROM_addr = 3'b111; #10;  // Address 7
        
        $stop;
    end
endmodule