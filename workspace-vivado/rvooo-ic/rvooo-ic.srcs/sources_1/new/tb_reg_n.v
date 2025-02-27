`timescale 1ns / 1ps
`include "constants.vh"  // constants
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2025 09:52:06 AM
// Design Name: 
// Module Name: tb_reg_n
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



module tb_reg_n();

    reg [`REG_WIDTH-1:0] i_s;
    reg ld_s, pwr_on_s, clk_s, rst_s;
    wire  [`REG_WIDTH-1:0] q_s;

    // device under test
    reg_n #(.WIDTH(`REG_WIDTH)) dut (
        .i(i_s),
        .q(q_s),
        .ld(ld_s),
        .pwr_on(pwr_on_s),
        .clk(clk_s),
        .rst(rst_s)
    );
    
    // clock procedure
    always begin
        clk_s <= 0;
        #10;
        clk_s <= 1;
        #10;
    end
    
    // vector procedure (32 bit register)
    initial begin 
        rst_s <= 1;
        i_s <= 32'h00000000;
        ld_s <= 0;
        pwr_on_s <= 1; // power on
        @(posedge clk_s);
        #5 rst_s <= 0;
        i_s <= 32'h00000017;
        ld_s <= 1;
        @(posedge clk_s);
        #5 i_s <= 32'h00000013;
        ld_s <= 0;
        #25 pwr_on_s <= 0; // power off
        #10;
        i_s <= 32'h00000015;
        ld_s <= 1;
        
        @(posedge clk_s);
        ld_s <= 0;
        #40 pwr_on_s <= 1;  // power on
        #5 rst_s <= 1;
        @(posedge clk_s);
        #5 rst_s <= 0;
        ld_s <= 1;
        i_s <= 32'h000000FA;
        
        
    
    end
    
    



endmodule
