`timescale 1ns / 1ps
`include "constants.vh"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2025 11:04:39 AM
// Design Name: 
// Module Name: iram
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


module iram #(parameter ADDR_LEN = `ADDR_LEN, parameter IRAM_WIDTH = `IRAM_WIDTH, parameter IRAM_DEPTH = `IRAM_DEPTH) (addr, data, pwr_on);
    
    input[ADDR_LEN-1:0] addr;
    input pwr_on;
    output [IRAM_WIDTH-1:0] data;
    reg [IRAM_WIDTH-1:0] memory [0:IRAM_DEPTH];
    
    integer i;
    
    initial begin
        for (i = 0; i < IRAM_DEPTH; i = i + 1) begin
            memory[i] = {IRAM_WIDTH{1'b0}};
        end
        $readmemh("firmware.mem", memory);
    end

//////////////////////////////////////////////////////////////////////////////////
// intermittent power behavior simulation 
`ifdef INTERMITTENT_PWR_SIM
    always @(pwr_on) begin
        if (pwr_on == 0) begin
            for (i = 0; i < IRAM_DEPTH; i = i + 1) begin
                memory[i] = {IRAM_WIDTH{1'bX}};
            end
        end
    end 
`endif
//////////////////////////////////////////////////////////////////////////////////

  
    assign data = memory[addr];

endmodule
