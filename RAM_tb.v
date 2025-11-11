`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2025 01:46:34 PM
// Design Name: 
// Module Name: RAM_tb
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

module RAM_tb;
    // Testbench signals
    reg clk, rst, w;
    reg [7:0] data_in;
    reg [2:0] data_adr;
    wire [7:0] data_out;
    
    // Instantiate the Unit Under Test (UUT)
    RAM UUT (
        .clk(clk),
        .rst(rst),
        .w(w),
        .data_in(data_in),
        .data_adr(data_adr),
        .data_out(data_out)
    );
    
    // Clock generation
    always #5 clk = ~clk;  // 100 MHz clock (10ns period)
    
    // Test procedure
    initial begin
        // Initialize signals
        clk = 0;
        rst = 1;
        w = 0;
        data_in = 8'd0;
        data_adr = 3'd0;
        
        // Turn reset to instantiate values
        #20;
        rst = 0;
        
        // Test 1: Write data to all 8 memory locations
        w = 1;  // Write mode
        data_adr = 3'b000; data_in = 8'hAA; #10;
        data_adr = 3'b001; data_in = 8'hBB; #10;
        data_adr = 3'b010; data_in = 8'hCC; #10;
        data_adr = 3'b011; data_in = 8'hDD; #10;
        data_adr = 3'b100; data_in = 8'hEE; #10;
        data_adr = 3'b101; data_in = 8'hFF; #10;
        data_adr = 3'b110; data_in = 8'h11; #10;
        data_adr = 3'b111; data_in = 8'h22; #10;
        
        // Test 2: Read back data from all locations
        w = 0;  // Read mode
        data_adr = 3'b000; #10;
        data_adr = 3'b001; #10;
        data_adr = 3'b010; #10;
        data_adr = 3'b011; #10;
        data_adr = 3'b100; #10;
        data_adr = 3'b101; #10;
        data_adr = 3'b110; #10;
        data_adr = 3'b111; #10;
        
        // Test 3: Overwrite specific location and verify
        w = 1;  // Write mode
        data_adr = 3'b000; data_in = 8'h99; #10;
        
        w = 0;  // Read mode
        data_adr = 3'b000; #10;
        
        // Test 4: Reset test
        rst = 1; #10;
        rst = 0; #10;
        
        w = 0;  // Read mode
        data_adr = 3'b000; #10;
        data_adr = 3'b001; #10;
        data_adr = 3'b010; #10;
        data_adr = 3'b011; #10;
        data_adr = 3'b100; #10;
        data_adr = 3'b101; #10;
        data_adr = 3'b110; #10;
        data_adr = 3'b111; #10;
        
        $stop;
    end
endmodule