`timescale 1ns / 1ps
`include "constants.vh"  // constants
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2025 11:33:27 AM
// Design Name: 
// Module Name: tb_iram
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


module tb_iram();

    reg [`ADDR_LEN-1:0] addr_s;
    reg pwr_on_s;
    wire [`IRAM_WIDTH-1:0] data_s;
    
    integer i;

    iram #(.ADDR_LEN(`ADDR_LEN), .IRAM_WIDTH(`IRAM_WIDTH), .IRAM_DEPTH(`IRAM_DEPTH)) dut (
        .addr(addr_s), 
        .data(data_s), 
        .pwr_on(pwr_on_s)
    );
    
    initial begin
        pwr_on_s <= 1;  // power on
        // read memory
        for (i = 0; i < 512 / 2; i = i + 1) begin
            addr_s = i;
            #1;  
        end
        
        pwr_on_s <= 0;  // power off

        for (i = `IRAM_DEPTH / 2; i < 512; i = i + 1) begin
            addr_s = i;
            #1;  
        end
        
        
        pwr_on_s <= 1;  // power on again
        addr_s = 5;  // test if we lost the IRAM content
        
    
    end

endmodule
